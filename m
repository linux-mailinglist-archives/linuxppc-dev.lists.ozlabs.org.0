Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BE01C56B3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 15:23:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GgQV370MzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 23:23:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fruBUflD; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GgJv1xD5zDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 23:18:20 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id q124so997086pgq.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YTVuB3nFO2ZJkwopWJScapBjoH2ODr8djIHuBvrmxls=;
 b=fruBUflDQ6Jeq31XBd3e7ltzEHuo9b/4IfeOLDlJxtRoAHNVReRI4naQPO8gaw9ItY
 oTH4F4i0UGGmndg13WybQGu5JAx1DohGtTWybng2+Qb3WimoaR/cd+IYWZpA38zDZNjc
 ESbdDRGoJGq3pgJmzssH/d9Mgy0xGnno3T1IJAMO1ojEEcgv0Hz91k0k6ELOCkKvABm4
 +wSO9l57ugUBf4HWTPbqQB6+5p79v7TE0bebHVmPWiVgxKNZGOR7kv24hrtvRpe63vmF
 TKU6PNwIkhG6wWAJFbSWbJxU58njxZQlJajAdmJZm2AUDlXm4XN0/+XHppMvuiTQD825
 ksCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YTVuB3nFO2ZJkwopWJScapBjoH2ODr8djIHuBvrmxls=;
 b=qS7e1AYGI1gPZqEpC1CG7xsdp9d3mgLsxe5RpHCiAN8BB6R5kJ+TfxRBihYvjO7NX9
 Qel3oSWLI1HajNmPGyVXlvR4NvARlBwT2APzu21K92Sxww3B/mMtSt8UReruMoX4d6Ma
 a/bj6FhZT8rlyW9YFLxa2SjQObcYXZkUi8FTUVz3wl+Tn3WPrO1Eq4YVGN3YAVxwIQU6
 oigSmL9rrw7LQ4z0Obi8RGHtg+hEo7yl538j5/i/Jezr7Co6joZhOwmJ9QDnPzBlJW2D
 4tbz4G3BVR3RB0mT2pRtOrHap2j8xBKfazm6ykcYF3CTIqK6JdYZHhUt8MCcXAxYxMPY
 jF7Q==
X-Gm-Message-State: AGi0PuYgiBe8jryJxhJZLMqLr1NdIzYCEjhLsScxAi/d25Lu+CgN+FSX
 SfjvkbFJyAD2Liulk+apY9M=
X-Google-Smtp-Source: APiQypKlF0tkB910YoBZeknyoe9MlscvGyvM0R4uMbc7bEc9kOFPUpDJJ2pcEUb510HcPsDkqbHR4Q==
X-Received: by 2002:a65:4107:: with SMTP id w7mr2715562pgp.438.1588684697051; 
 Tue, 05 May 2020 06:18:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g40sm2101882pje.38.2020.05.05.06.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 06:18:15 -0700 (PDT)
Subject: Re: [PATCH v2 17/20] mm: free_area_init: allow defining max_zone_pfn
 in descending order
To: Mike Rapoport <rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
 <20200503174138.GA114085@roeck-us.net> <20200503184300.GA154219@roeck-us.net>
 <20200504153901.GM14260@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <ca099c3e-c0bc-cd2f-cdb0-852dfc2c10db@roeck-us.net>
Date: Tue, 5 May 2020 06:18:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504153901.GM14260@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Nick Hu <nickhu@andestech.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Qian Cai <cai@lca.pw>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, Brian Cain <bcain@codeaurora.org>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/4/20 8:39 AM, Mike Rapoport wrote:
> On Sun, May 03, 2020 at 11:43:00AM -0700, Guenter Roeck wrote:
>> On Sun, May 03, 2020 at 10:41:38AM -0700, Guenter Roeck wrote:
>>> Hi,
>>>
>>> On Wed, Apr 29, 2020 at 03:11:23PM +0300, Mike Rapoport wrote:
>>>> From: Mike Rapoport <rppt@linux.ibm.com>
>>>>
>>>> Some architectures (e.g. ARC) have the ZONE_HIGHMEM zone below the
>>>> ZONE_NORMAL. Allowing free_area_init() parse max_zone_pfn array even it is
>>>> sorted in descending order allows using free_area_init() on such
>>>> architectures.
>>>>
>>>> Add top -> down traversal of max_zone_pfn array in free_area_init() and use
>>>> the latter in ARC node/zone initialization.
>>>>
>>>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>>>
>>> This patch causes my microblazeel qemu boot test in linux-next to fail.
>>> Reverting it fixes the problem.
>>>
>> The same problem is seen with s390 emulations.
> 
> Yeah, this patch breaks some others as well :(
> 
> My assumption that max_zone_pfn defines architectural limit for maximal
> PFN that can belong to a zone was over-optimistic. Several arches
> actually do that, but others do
> 
> 	max_zone_pfn[ZONE_DMA] = MAX_DMA_PFN;
> 	max_zone_pfn[ZONE_NORMAL] = max_pfn;
> 
> where MAX_DMA_PFN is build-time constrain and max_pfn is run time limit
> for the current system.
> 
> So, when max_pfn is lower than MAX_DMA_PFN, the free_init_area() will
> consider max_zone_pfn as descending and will wrongly calculate zone
> extents.
> 
> That said, instead of trying to create a generic way to special case
> ARC, I suggest to simply use the below patch instead.
> 

As a reminder, I reported the problem against s390 and microblazeel
(interestingly enough, microblaze (big endian) works), not against arc.

Guenter

> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index 41eb9be1653c..386959bac3d2 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -77,6 +77,11 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
>  		base, TO_MB(size), !in_use ? "Not used":"");
>  }
>  
> +bool arch_has_descending_max_zone_pfns(void)
> +{
> +	return true;
> +}
> +
>  /*
>   * First memory setup routine called from setup_arch()
>   * 1. setup swapper's mm @init_mm
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index b990e9734474..114f0e027144 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -7307,6 +7307,15 @@ static void check_for_memory(pg_data_t *pgdat, int nid)
>  	}
>  }
>  
> +/*
> + * Some architecturs, e.g. ARC may have ZONE_HIGHMEM below ZONE_NORMAL. For
> + * such cases we allow max_zone_pfn sorted in the descending order
> + */
> +bool __weak arch_has_descending_max_zone_pfns(void)
> +{
> +	return false;
> +}
> +
>  /**
>   * free_area_init - Initialise all pg_data_t and zone data
>   * @max_zone_pfn: an array of max PFNs for each zone
> @@ -7324,7 +7333,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
>  {
>  	unsigned long start_pfn, end_pfn;
>  	int i, nid, zone;
> -	bool descending = false;
> +	bool descending;
>  
>  	/* Record where the zone boundaries are */
>  	memset(arch_zone_lowest_possible_pfn, 0,
> @@ -7333,14 +7342,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
>  				sizeof(arch_zone_highest_possible_pfn));
>  
>  	start_pfn = find_min_pfn_with_active_regions();
> -
> -	/*
> -	 * Some architecturs, e.g. ARC may have ZONE_HIGHMEM below
> -	 * ZONE_NORMAL. For such cases we allow max_zone_pfn sorted in the
> -	 * descending order
> -	 */
> -	if (MAX_NR_ZONES > 1 && max_zone_pfn[0] > max_zone_pfn[1])
> -		descending = true;
> +	descending = arch_has_descending_max_zone_pfns();
>  
>  	for (i = 0; i < MAX_NR_ZONES; i++) {
>  		if (descending)
> 
>> Guenter
>>
>>> qemu command line:
>>>
>>> qemu-system-microblazeel -M petalogix-ml605 -m 256 \
>>> 	-kernel arch/microblaze/boot/linux.bin -no-reboot \
>>> 	-initrd rootfs.cpio \
>>> 	-append 'panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyS0,115200' \
>>> 	-monitor none -serial stdio -nographic
>>>
>>> initrd:
>>> 	https://github.com/groeck/linux-build-test/blob/master/rootfs/microblazeel/rootfs.cpio.gz
>>> configuration:
>>> 	https://github.com/groeck/linux-build-test/blob/master/rootfs/microblazeel/qemu_microblazeel_ml605_defconfig
>>>
>>> Bisect log is below.
>>>
>>> Guenter
>>>
>>> ---
>>> # bad: [fb9d670f57e3f6478602328bbbf71138be06ca4f] Add linux-next specific files for 20200501
>>> # good: [6a8b55ed4056ea5559ebe4f6a4b247f627870d4c] Linux 5.7-rc3
>>> git bisect start 'HEAD' 'v5.7-rc3'
>>> # good: [068b80b68a670f0b17288c8a3d1ee751f35162ab] Merge remote-tracking branch 'drm/drm-next'
>>> git bisect good 068b80b68a670f0b17288c8a3d1ee751f35162ab
>>> # good: [46c70fc6a3ac35cd72ddad248dcbe4eee716d2a5] Merge remote-tracking branch 'drivers-x86/for-next'
>>> git bisect good 46c70fc6a3ac35cd72ddad248dcbe4eee716d2a5
>>> # good: [f39c4ad479a2f005f972a2b941b40efa6b9c9349] Merge remote-tracking branch 'rpmsg/for-next'
>>> git bisect good f39c4ad479a2f005f972a2b941b40efa6b9c9349
>>> # bad: [165d3ee0162fe28efc2c8180176633e33515df15] ipc-convert-ipcs_idr-to-xarray-update
>>> git bisect bad 165d3ee0162fe28efc2c8180176633e33515df15
>>> # good: [001f1d211ed2ed0f005838dc4390993930bbbd69] mm: remove early_pfn_in_nid() and CONFIG_NODES_SPAN_OTHER_NODES
>>> git bisect good 001f1d211ed2ed0f005838dc4390993930bbbd69
>>> # bad: [aaad7401bd32f10c1d591dd886b3a9b9595c6d77] mm/vmsan: fix some typos in comment
>>> git bisect bad aaad7401bd32f10c1d591dd886b3a9b9595c6d77
>>> # bad: [09f9d0ab1fbed85623b283995aa7a7d78daa1611] khugepaged: allow to collapse PTE-mapped compound pages
>>> git bisect bad 09f9d0ab1fbed85623b283995aa7a7d78daa1611
>>> # bad: [c942fc8a3e5088407bc32d94f554bab205175f8a] mm/vmstat.c: do not show lowmem reserve protection information of empty zone
>>> git bisect bad c942fc8a3e5088407bc32d94f554bab205175f8a
>>> # bad: [b29358d269ace3826d8521bea842fc2984cfc11b] mm/page_alloc.c: rename free_pages_check() to check_free_page()
>>> git bisect bad b29358d269ace3826d8521bea842fc2984cfc11b
>>> # bad: [be0fb591a1f1df20a00c8f023f9ca4891f177b0d] mm: simplify find_min_pfn_with_active_regions()
>>> git bisect bad be0fb591a1f1df20a00c8f023f9ca4891f177b0d
>>> # bad: [c17422a008d36dcf3e9f51469758c5762716cb0a] mm: rename free_area_init_node() to free_area_init_memoryless_node()
>>> git bisect bad c17422a008d36dcf3e9f51469758c5762716cb0a
>>> # bad: [51a2f644fd020d5f090044825c388444d11029d5] mm: free_area_init: allow defining max_zone_pfn in descending order
>>> git bisect bad 51a2f644fd020d5f090044825c388444d11029d5
>>> # first bad commit: [51a2f644fd020d5f090044825c388444d11029d5] mm: free_area_init: allow defining max_zone_pfn in descending order
> 

