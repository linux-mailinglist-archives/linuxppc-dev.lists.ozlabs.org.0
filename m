Return-Path: <linuxppc-dev+bounces-12660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A3BB7B39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 19:21:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdb784XqXz3d4F;
	Sat,  4 Oct 2025 03:21:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.71.208.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759512100;
	cv=none; b=ORh1RIk3HR3xcjTT08Gkq/pUxOo12ySWRwvgoJismtjY0BaTDlHNUG28ln1vP/8Fo1xJRwRIUAD5wVnBto9H1Tt9EKZatam+zmXqEUXl8Sm9wkzVGrZ80eigmGf+YUWnYMtxTCYNu9KzXE8gGFgsl7KirO1SiVK5rCxKlxK5yti/5tDLBdHSoxt5mH0gWgsgJjsKu+1jFexac9VQlrD4B4XbUlJhM5LXT1qNF4JEJD//e+yjbFdujvEpmXvM9wDa34FWD9IcDeHG/WoMXuDXkuZOG95jWGq8kbmmrKoczTKQ8C9IebwiPzOESLD1Nir4sSkl9K9ARNIhvnx0U+/Urg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759512100; c=relaxed/relaxed;
	bh=Zng9vbugJ96jo23SWsSK+sYWjXU4T6lDUgmXQbXs8jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D51Zr8uKmPHrqqMsy4xC5Y7AX9WiOZByNC5Tig2xoCc8mT5zd2c+scejS0qOPgk/0Jva3ZKwwVyMmYMFzI1aj4FkE6dX+8sEgmNb5cqXYIYDXsBftd9uTbpEJa3c7bzZvcDVo0lTxwQBKGkPfja/bDPJMbKS3gfC4qLXAPheESQD5rYj1qAARM06hBFsTtgLY9Fizl2v8Idr1DgjvBv7QlxuFVnzJZooGTyK/Q0Dq7oXTuQMHjnm1mSO+dVAR4Niz19DlMuabfMa3PuwoyetBFbtgJagRWz6RMl5HghaeAbY6ECj9/lgjo0Oq+HQBj1sHZQto9NZ5b4gR7BLASqSHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=bell.net; dkim=pass (2048-bit key; unprotected) header.d=bell.net header.i=@bell.net header.a=rsa-sha256 header.s=selector1 header.b=eNDNDbFQ; dkim-atps=neutral; spf=pass (client-ip=209.71.208.31; helo=cmx-mtlrgo002.bell.net; envelope-from=dave.anglin@bell.net; receiver=lists.ozlabs.org) smtp.mailfrom=bell.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bell.net header.i=@bell.net header.a=rsa-sha256 header.s=selector1 header.b=eNDNDbFQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bell.net (client-ip=209.71.208.31; helo=cmx-mtlrgo002.bell.net; envelope-from=dave.anglin@bell.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 118 seconds by postgrey-1.37 at boromir; Sat, 04 Oct 2025 03:21:37 AEST
Received: from cmx-mtlrgo002.bell.net (mta-mtl-008.bell.net [209.71.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdb752bq4z3d42
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 03:21:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1759512097; 
        bh=Zng9vbugJ96jo23SWsSK+sYWjXU4T6lDUgmXQbXs8jQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=eNDNDbFQSYYxcmd36h8IvEUtbiKzl1yXrsxHmu20+8EE7Zh2hQIFlljoNn9eStDGVw7SuxrsrnM9Fb4P8BndcuGU9pGGHKwr3yhamlXUL2Cn0FfFcgar74Y3/uqgnV2zmxi4AIoXMrV0qwQNep+Yn+fCgH4qf7BSmD1zU1MlG7Yt3O3gBPqGzJfBubQrozh0bLFPCbY35jDP5BJEK4ciRUtDfONC9GESfHtMZbxvy5sVk/VODh2e1wY93dHYkdEeS/KDkbLhea2DdpXreF0yO3KCnMnvxspXK+Q5NrSZ9X5K2JEEJ/zenYWk/7AtjwnZKIb3bakm946+3xCJPbESng==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-Originating-IP: [142.126.189.246]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687D2719085236A8
X-RazorGate-Vade: dmFkZTEz5RsOfS/EjyC9+Ub2YxMQTERFV1WLvzAUX6YmdSOutxh9nRbLS04S3w48higa1O8ySU0qm+pqSRX3wt8t7qkudb+hf38O2cDVBt0Kodl0paa0HIkabXXcLE04OYO2sfJDqHB/jS8wt+02VySn6T7scpRa2/Wb/W0TedGsH+DNn2gMwBQkWLPoywlRU31ryXtBiYmXlotzDw/m9sHi6Ve2Oe4ZbS7rGoU0eMfVxQ1vdpTbvuVoBHAzbOn/HOzN2sm3iazxmdQXB2zliRM2lqfuZ84PwaM8At8uXBomYirF3V7eWOpaQHd67GeKnlALIR04/2bSPWgtsioImHLtEYMUYILOLrqzu60KxaDoJfi0jS84+pz1YHvEjCAHio3FYqB5B70FUgeLOG5tpRvdjUaDoceW5vxb8rUVFiNlIZEORiP8Ryt2DdKF/msyF/ll7HjQWR/Z37leTmRcz68buYNSLzuuzJKUIPl92lqv8sTwABSZMs3YepgBjMuPskBbPEHdnWoUKJbVe1qcVlI3GQOAXS5mf3ynF6weGnFTuZ4HZbi4HX3L30T7A7X8Qv1rTZ3rpm5EpmFtAmqDAuNKPjQAa7kjbsf/J8ObDge/LHWP85rEf+OYzINc2XvkMdaAGSz6QlO/27zkjU+6gaSl175fxf9Mjs880jgHp7z6R/5qNA
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.189.246) by cmx-mtlrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 687D2719085236A8; Fri, 3 Oct 2025 13:18:32 -0400
Message-ID: <610b10bc-1aa2-4fad-a40b-be5fcfa04430@bell.net>
Date: Fri, 3 Oct 2025 13:18:32 -0400
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Leon Romanovsky <leonro@nvidia.com>, Andreas Larsson <andreas@gaisler.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Geoff Levand <geoff@infradead.org>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 iommu@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux.dev,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 Magnus Lindholm <linmag7@gmail.com>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com>
From: John David Anglin <dave.anglin@bell.net>
Content-Language: en-US
Autocrypt: addr=dave.anglin@bell.net; keydata=
 xsFNBFJfN1MBEACxBrfJ+5RdCO+UQOUARQLSsnVewkvmNlJRgykqJkkI5BjO2hhScE+MHoTK
 MoAeKwoLfBwltwoohH5RKxDSAIWajTY5BtkJBT23y0hm37fN2JXHGS4PwwgHTSz63cu5N1MK
 n8DZ3xbXFmqKtyaWRwdA40dy11UfI4xzX/qWR3llW5lp6ERdsDDGHm5u/xwXdjrAilPDk/av
 d9WmA4s7TvM/DY3/GCJyNp0aJPcLShU2+1JgBxC6NO6oImVwW07Ico89ETcyaQtlXuGeXYTK
 UoKdEHQsRf669vwcV5XbmQ6qhur7QYTlOOIdDT+8zmBSlqBLLe09soATDciJnyyXDO1Nf/hZ
 gcI3lFX86i8Fm7lQvp2oM5tLsODZUTWVT1qAFkHCOJknVwqRZ8MfOvaTE7L9hzQ9QKgIKrSE
 FRgf+gs1t1vQMRHkIxVWb730C0TGiMGNn2oRUV5O5QEdb/tnH0Te1l+hX540adKZ8/CWzzW9
 vcx+qD9IWLRyZMsM9JnmAIvYv06+YIcdpbRYOngWPd2BqvktzIs9mC4n9oU6WmUhBIaGOGnt
 t/49bTRtJznqm/lgqxtE2NliJN79dbZJuJWe5HkjVa7mP4xtsG59Rh2hat9ByUfROOfoZ0dS
 sVHF/N6NLWcf44trK9HZdT/wUeftEWtMV9WqxIwsA4cgSHFR2QARAQABzTdKb2huIERhdmlk
 IEFuZ2xpbiAoRGViaWFuIFBvcnRzKSA8ZGF2ZS5hbmdsaW5AYmVsbC5uZXQ+wsF3BBMBCAAh
 BQJSXzdTAhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEF2/za5fGU3xs/4P/15sNizR
 ukZLNYoeGAd6keRtNcEcVGEpRgzc/WYlXCRTEjRknMvmCu9z13z8qB9Y9N4JrPdp+NQj5HEs
 ODPI+1w1Mjj9R2VZ1v7suFwhjxMTUQUjCsgna1H+zW/UFsrL5ERX2G3aUKlVdYmSWapeGeFL
 xSMPzawPEDsbWzBzYLSHUOZexMAxoJYWnpN9JceEcGvK1SU2AaGkhomFoPfEf7Ql1u3Pgzie
 ClWEr2QHl+Ku1xW0qx5OLKHxntaQiu30wKHBcsF0Zx2uVGYoINJl/syazfZyKTdbmJnEYyNa
 Bdbn7B8jIkVCShLOWJ8AQGX/XiOoL/oE9pSZ60+MBO9qd18TGYByj0X2PvH+OyQGul5zYM7Q
 7lT97PEzh8xnib49zJVVrKDdJds/rxFwkcHdeppRkxJH0+4T0GnU2IZsEkvpRQNJAEDmEE8n
 uRfssr7RudZQQwaBugUGaoouVyFxzCxdpSYL6zWHA51VojvJYEBQDuFNlUCqet9LtNlLKx2z
 CAKmUPTaDwPcS3uOywOW7WZrAGva1kz9lzxZ+GAwgh38HAFqQT8DQvW8jnBBG4m4q7lbaum3
 znERv7kcfKWoWS7fzxLNTIitrbpYA3E7Zl9D2pDV3v55ZQcO/M35K9teRo6glrtFDU/HXM+r
 ABbh8u9UnADbPmJr9nb7J0tZUSS/zsFNBFJfN1MBEADBzhVn4XyGkPAaFbLPcMUfwcIgvvPF
 UsLi9Q53H/F00cf7BkMY40gLEXvsvdUjAFyfas6z89gzVoTUx3HXkJTIDTiPuUc1TOdUpGYP
 hlftgU+UqW5O8MMvKM8gx5qn64DU0UFcS+7/CQrKOJmzktr/72g98nVznf5VGysa44cgYeoA
 v1HuEoqGO9taA3Io1KcGrzr9cAZtlpwj/tcUJlc6H5mqPHn2EdWYmJeGvNnFtxd0qJDmxp5e
 YVe4HFNjUwsb3oJekIUopDksAP41RRV0FM/2XaPatkNlTZR2krIVq2YNr0dMU8MbMPxGHnI9
 b0GUI+T/EZYeFsbx3eRqjv1rnNg2A6kPRQpn8dN3BKhTR5CA7E/cs+4kTmV76aHpW8m/NmTc
 t7KNrkMKfi+luhU2P/sKh7Xqfbcs7txOWB2V4/sbco00PPxWr20JCA5hYidaKGyQxuXdPUlQ
 Qja4WJFnAtBhh3Oajgwhbvd6S79tz1acjNXZ89b8IN7yDm9sQ+4LhWoUQhB5EEUUUVQTrzYS
 yTGN1YTTO5IUU5UJHb5WGMnSPLLArASctOE01/FYnnOGeU+GFIeQp91p+Jhd07hUr6KWYeJY
 OgEmu+K8SyjfggCWdo8aGy0H3Yr0YzaHeK2HrfC3eZcUuo+yDW3tnrNwM1rd1i3F3+zJK18q
 GnBxEQARAQABwsFfBBgBCAAJBQJSXzdTAhsMAAoJEF2/za5fGU3xNDQP/ikzh1NK/UBrWtpN
 yXLbype4k5/zyQd9FIBxAOYEOogfKdkp+Yc66qNf36gO6vsokxsDXU9me1n8tFoB/DCdzKbQ
 /RjKQRMNNR4fT2Q9XV6GZYSL/P2A1wzDW06tEI+u+1dV40ciQULQ3ZH4idBW3LdN+nloQf/C
 qoYkOf4WoLyhSzW7xdNPZqiJCAdcz9djN79FOz8US+waBCJrL6q5dFSvvsYj6PoPJkCgXhiJ
 hI91/ERMuK9oA1oaBxCvuObBPiFlBDNXZCwmUk6qzLDjfZ3wdiZCxc5g7d2e2taBZw/MsKFc
 k+m6bN5+Hi1lkmZEP0L4MD6zcPuOjHmYYzX4XfQ61lQ8c4ztXp5cKkrvaMuN/bD57HJ6Y73Q
 Y+wVxs9x7srl4iRnbulCeiSOAqHmwBAoWaolthqe7EYL4d2+CjPCcfIuK7ezsEm8c3o3EqC4
 /UpL1nTi0rknRTGc0VmPef+IqQUj33GGj5JRzVJZPnYyCx8sCb35Lhs6X8ggpsafUkuKrH76
 XV2KRzaE359RgbM3pNEViXp3NclPYmeu+XI8Ls/y6tSq5e/o/egktdyJj+xvAj9ZS18b10Jp
 e67qK8wZC/+N7LGON05VcLrdZ+FXuEEojJWbabF6rJGN5X/UlH5OowVFEMhD9s31tciAvBwy
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <20251003150144.GC3360665@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-03 11:01 a.m., Jason Gunthorpe wrote:
> This doesn't actually use the virt at all:
> 
> 	offset = ((unsigned long) addr) & ~IOVP_MASK;
> 	if((size % L1_CACHE_BYTES) || ((unsigned long)addr % L1_CACHE_BYTES))
> 		ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);
> 
> And ccio_io_pdir_entry():
> 	pa = lpa(vba);
> 
> Is a special instruction that uses virt but AI tells me that special
> LPA instruction is returning phys. Not sure if that is a different
> value than virt_to_phys()..

ccio_io_pdir_entry currently only supports KERNEL_SPACE.  For KERNEL_SPACE, lpa() and
virt_to_phys() are equivalent if page is mapped.  lpa() returns 0 if a non-access data
TLB fault occurs (i.e., page isn't mapped).  Not sure if that matters.
> IDK, I'm not feeling brave enough to drop the LPA but maybe include
> this note in the commit message.
> 

-- 
John David Anglin  dave.anglin@bell.net

