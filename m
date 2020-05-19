Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B641D8DCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 04:52:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R0mF54rQzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 12:52:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VlxgfkqF; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R0kF697PzDqhb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 12:50:45 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id t40so713489pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 19:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Um0MqAkT2AlqVBUz0LYl439Zam1W4yGyACS/84j23pE=;
 b=VlxgfkqFfgs2apfaHWWzr3g6t+6/wCR2VJC7ihA4e0l96IgCbjQktpnPgecT+Sv7vY
 R6EhRJvVj9HRsZsqdfzbSQDoj0FxQyENTy1PaQ3jfbPF9Anj2c/e7w3YFCiNWHWEG7AE
 IQWB+ljTEmCh/JbiDhP8pITX8gCTE13vaQI5fC68J/0nzbwlh/s50UdehSHjgYt79Km4
 C3Un28P8iJkovjp8wkEcJqyuskbdRYyIEqCo0IqMt5udz8lUnEkPIDEUo5BRNZ/xNRwb
 GVnrRl5jt+QVlTqsEfqDY9c6anPu+OnsYBU32yOshZI4hLBu17zheYIb0ag81v/WjxIh
 ooFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Um0MqAkT2AlqVBUz0LYl439Zam1W4yGyACS/84j23pE=;
 b=s9yydkP+JiUrkO8yvRnXsYzELr3/nIW3LjVdibxFRWaju4sxsbjjcRfLQN6jXLGqy+
 QWvD1RmRZFhUigF88GzKCjlEtPhOyCv3Nmm3NQtrA1p8qQ/aXVWBwVK3KEPr8Ij0dlUb
 j4k1klv4j79oVL7doXexVyJ3DUvTxcnGmxQgR8as8Nkv0ddXYxNWAKcGgvcWQ4eEZ9JX
 BaNyRBv+xua2NzO1Fze0+LGI/7vAB0ymYI1Cwafrab/cSq6jdTCw2FIo0iDyK/qbslia
 76ey8r3Fv1Och0at+haqlpMtNVKKEnv8CIFroA/DqGavJpzOgyRWxkfbnUsssyjs9/To
 y1FQ==
X-Gm-Message-State: AOAM533a45DQxUBvIreTfISpI2gaaDUT8MtKLrrOTNMR+J/gI5B3awBf
 71ArTRcsdR4hrLhqf1Xe540=
X-Google-Smtp-Source: ABdhPJxUEb40eUAEJc/TR1ypP/gVIih2peaEeOHrNggdWNiZOeiW6/A7lE1LV83bcEZdcDNdsiy/5g==
X-Received: by 2002:a17:902:b712:: with SMTP id
 d18mr18073790pls.143.1589856641522; 
 Mon, 18 May 2020 19:50:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w23sm18485pgc.78.2020.05.18.19.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 19:50:39 -0700 (PDT)
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
To: Ira Weiny <ira.weiny@intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200516223306.GA161252@roeck-us.net>
 <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
 <20200518042932.GA59205@roeck-us.net>
 <20200519000352.GF3025231@iweiny-DESK2.sc.intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <47757f51-15f2-3abe-9035-abdb3ba5816e@roeck-us.net>
Date: Mon, 18 May 2020 19:50:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519000352.GF3025231@iweiny-DESK2.sc.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ira,

On 5/18/20 5:03 PM, Ira Weiny wrote:
> On Sun, May 17, 2020 at 09:29:32PM -0700, Guenter Roeck wrote:
>> On Sun, May 17, 2020 at 08:49:39PM -0700, Ira Weiny wrote:
>>> On Sat, May 16, 2020 at 03:33:06PM -0700, Guenter Roeck wrote:
>>>> On Thu, May 07, 2020 at 07:59:55AM -0700, ira.weiny@intel.com wrote:
>>>>> From: Ira Weiny <ira.weiny@intel.com>
>>>>>
>>>>> Every single architecture (including !CONFIG_HIGHMEM) calls...
>>>>>
>>>>> 	pagefault_enable();
>>>>> 	preempt_enable();
>>>>>
>>>>> ... before returning from __kunmap_atomic().  Lift this code into the
>>>>> kunmap_atomic() macro.
>>>>>
>>>>> While we are at it rename __kunmap_atomic() to kunmap_atomic_high() to
>>>>> be consistent.
>>>>>
>>>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>>>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>>>>
>>>> This patch results in:
>>>>
>>>> Starting init: /bin/sh exists but couldn't execute it (error -14)
>>>>
>>>> when trying to boot microblazeel:petalogix-ml605 in qemu.
>>>
>>> Thanks for the report.  I'm not readily seeing the issue.
>>>
>>> Do you have a kernel config?  Specifically is CONFIG_HIGHMEM set?
>>>
>> See below. Yes, CONFIG_HIGHMEM is set.
>>
>> The scripts used to build and boot the image are at:
>>
>> https://github.com/groeck/linux-build-test/tree/master/rootfs/microblazeel
> 
> Despite finding the obvious error earlier today I've still been trying to get
> this to work.
> 
> I had to make some slight modifications to use the 0-day cross compile build
> and my local qemu build.  But those were pretty minor modifications.  I'm
> running on x86_64 host.
> 
> With those slight mods to the scripts I get the following error even without my
> patch set on 5.7-rc4.  I have 1 cpu pegged at 100% while it is running...  Is
> there anything I can do to get more debug output?  Perhaps I just need to let
> it run longer?
> 

I don't think so. Try running it with "-d" parameter (run-qemu-microblazeel.sh
-d petalogix-s3adsp1800); that gives you the qemu command line. Once it says
"running", abort the script and execute qemu directly. Oh, and please update
the repository; turns out I didn't push for a while and made a number of
changes.

My compiler was compiled with buildroot (a long time ago). I don't recall if
it needed something special in the configuration, unfortunately.

Guenter

> Thanks,
> Ira
> 
> 16:46:54 > ../linux-build-test/rootfs/microblazeel/run-qemu-microblazeel.sh 
> Build reference: v5.7-rc4-2-g7c2411d7fb6a
> 
> Building microblaze:petalogix-s3adsp1800:qemu_microblazeel_defconfig ...
> running ................ failed (silent)
> ------------
> qemu log:
> qemu-system-microblazeel: terminating on signal 15 from pid 3277686 (/bin/bash)
> ------------
> Building microblaze:petalogix-ml605:qemu_microblazeel_ml605_defconfig ...
> running ................ failed (silent)
> ------------
> qemu log:
> qemu-system-microblazeel: terminating on signal 15 from pid 3277686 (/bin/bash)
> ------------
> 
> <env changes>
> 16:47:23 > git di
> diff --git a/rootfs/microblazeel/run-qemu-microblazeel.sh b/rootfs/microblazeel/run-qemu-microblazeel.sh
> index 68d4de39ab50..0d6a4f85308f 100755
> --- a/rootfs/microblazeel/run-qemu-microblazeel.sh
> +++ b/rootfs/microblazeel/run-qemu-microblazeel.sh
> @@ -3,7 +3,8 @@
>  dir=$(cd $(dirname $0); pwd)
>  . ${dir}/../scripts/common.sh
>  
> -QEMU=${QEMU:-${QEMU_BIN}/qemu-system-microblazeel}
> +#QEMU=${QEMU:-${QEMU_BIN}/qemu-system-microblazeel}
> +QEMU=/home/iweiny/dev/qemu/microblazeel-softmmu/qemu-system-microblazeel
>  PREFIX=microblazeel-linux-
>  ARCH=microblaze
>  PATH_MICROBLAZE=/opt/kernel/microblazeel/gcc-4.9.1/usr/bin
> diff --git a/rootfs/scripts/common.sh b/rootfs/scripts/common.sh
> index 8fa6a9be2b2f..c4550a27beaa 100644
> --- a/rootfs/scripts/common.sh
> +++ b/rootfs/scripts/common.sh
> @@ -1,5 +1,9 @@
>  #!/bin/bash
>  
> +# Set up make.cross
> +export COMPILER_INSTALL_PATH=$HOME/0day
> +export GCC_VERSION=6.5.0
> +
>  # Set the following variable to true to skip DC395/AM53C97 build tests
>  __skip_dc395=0
>  
> @@ -569,7 +573,7 @@ doclean()
>         then
>                 git clean -x -d -f -q
>         else
> -               make ARCH=${ARCH} mrproper >/dev/null 2>&1
> +               make.cross ARCH=${ARCH} mrproper >/dev/null 2>&1
>         fi
>  }
>  
> @@ -669,7 +673,7 @@ __setup_config()
>         cp ${__progdir}/${defconfig} arch/${arch}/configs
>      fi
>  
> -    if ! make ARCH=${ARCH} CROSS_COMPILE=${PREFIX} ${defconfig} >/dev/null 2>&1 </dev/null; then
> +    if ! make.cross ARCH=${ARCH} ${defconfig} >/dev/null 2>&1 </dev/null; then
>         return 2
>      fi
>  
> @@ -687,7 +691,7 @@ __setup_config()
>         if [[ "${rel}" = "v3.16" ]]; then
>             target="oldconfig"
>         fi
> -       if ! make ARCH=${ARCH} CROSS_COMPILE=${PREFIX} ${target} >/dev/null 2>&1 </dev/null; then
> +       if ! make.cross ARCH=${ARCH} ${target} >/dev/null 2>&1 </dev/null; then
>             return 1
>         fi
>      fi
> @@ -1038,7 +1042,7 @@ dosetup()
>      rootfs="$(setup_rootfs ${dynamic} ${rootfs})"
>      __common_fixups "${fixups}" "${rootfs}"
>  
> -    make -j${maxload} ARCH=${ARCH} CROSS_COMPILE=${PREFIX} ${EXTRAS} </dev/null >/dev/null 2>${logfile}
> +    make.cross -j${maxload} ARCH=${ARCH} ${EXTRAS} </dev/null >/dev/null 2>${logfile}
>      rv=$?
>      if [ ${rv} -ne 0 ]
>      then
> 
> </env changes>
> 

