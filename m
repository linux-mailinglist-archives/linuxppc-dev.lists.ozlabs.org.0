Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A0454E936
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 20:17:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP9Pk16WJz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 04:17:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZHsM2zO1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com; envelope-from=danielhb413@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZHsM2zO1;
	dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP9P44Vndz303H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 04:16:55 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id a21-20020a9d4715000000b0060bfaac6899so1526314otf.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 11:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Q6xTJMMpGFHSIv3KXqxDj+VQYOzJ4kigdSG7RfpA5PY=;
        b=ZHsM2zO1wUN/oHSmrdOGjSrEKTeqkkCrg3vmMCM9bVNo2vPdhV8iSiCsgF6W4tK/bb
         x/6kI81OrDF8zrOm8Hr93+e3f2DeEsnDxd2gDO2VF5kN0XHE31OnNTeFdEQlLXNZOtb9
         wO6J7+9ZqBmRKis49YboWzvdtao4AQZbPWQa+NoD+Ke72F1PS/wcZsJBMcAWtSXV7psO
         shTsykOJyoXmqVdK9nETZ13RcIHrB7Wi2F7AJqyi6ioj+DK0U3pFHKtv45WTdfeXWv/z
         woLlfoTnz0tq1O0Pc/3lwmb5F4wsZEjeSSfV3xBU5BQk861vzUDp+HbVWbApra2FzEuu
         onOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Q6xTJMMpGFHSIv3KXqxDj+VQYOzJ4kigdSG7RfpA5PY=;
        b=70ALAY3XSUu8RL/ejTvOeuK3Vf/ebqxyapvhK52CGK4THujGLKfqcG2c6JtSJ+yJSl
         TLoqx3+MiKjdgNx3ZZvctkFT//3UPjGRffatH3rO0s8uBk8ky86VZE7xico+BX67O95X
         cJdOHGBfZNuPQrffs8OK0Rfas0zhXMmcNuSRoJqptVGx98K0XYvynZkQ3gf/kH0Icxng
         OqGichhn4ci1Kal03g+N67kPUj8okxTJo0uVfCZQPctJoa35BFeAl0A11eL23u4QDEwb
         bUvkxdK0yY1CP1NVXeq1g100L+vmIb9aa+QPPbgKeZ8h0j4YlOy8HL/AzCimCTwzPx/E
         1QBw==
X-Gm-Message-State: AJIora/q9Z2dpM5XHzAxIcKhXGBtOlX9C3frYsmqk/xFpPaFaBJnDRGe
	Kw8Pqtw+qurG/v0MB6XpV4Q=
X-Google-Smtp-Source: AGRyM1toyS2sM6AjINIAKE/6aox9TMnsb0mjT9x9yn+oPIKjzsoA3DevJ0o2EKpg6kTMhY6QoGUAKQ==
X-Received: by 2002:a05:6830:19f1:b0:60c:3080:fcf8 with SMTP id t17-20020a05683019f100b0060c3080fcf8mr2571853ott.214.1655403411717;
        Thu, 16 Jun 2022 11:16:51 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ccc8:8e07:268b:a09:2834? ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
        by smtp.gmail.com with ESMTPSA id eb10-20020a056870a88a00b000f5f4ad194bsm1183282oab.25.2022.06.16.11.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 11:16:51 -0700 (PDT)
Message-ID: <ba1d72d4-a1f3-17ae-bd75-7c1ede5d0103@gmail.com>
Date: Thu, 16 Jun 2022 15:16:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/4] pseries-wdt: initial support for H_WATCHDOG-based
 watchdog timers
Content-Language: en-US
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Scott Cheloha <cheloha@linux.ibm.com>, linux-watchdog@vger.kernel.org
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <74ac21a1-d56f-50fb-71c2-e800e943f340@gmail.com>
 <e5d65186-8247-ac6e-d785-e560f380014a@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <e5d65186-8247-ac6e-d785-e560f380014a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/16/22 13:44, Tyrel Datwyler wrote:
> On 6/15/22 18:43, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> I tried this series out with mainline QEMU built with Alexey's patch [1]
>> and I wasn't able to get it to work. I'm using a simple QEMU command line
>> booting a fedora36 guest in a Power9 boston host:
> 
> I would assume the H_WATCHDOG hypercall is not implemented by the qemu pseries
> machine type. It is a very new hypercall.

Alexey implemented QEMU support for this hypercall here:

"[qemu] ppc/spapr: Implement H_WATCHDOG"
https://patchwork.ozlabs.org/project/qemu-ppc/patch/20220608030153.1862335-1-aik@ozlabs.ru/

It is under review in the QEMU mailing list. I tried it out with this series
and wasn't able to get it to work.


Thanks,

Daniel


> 
> -Tyrel
> 
>>
>> sudo  ./qemu-system-ppc64 \
>> -M
>> pseries,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off,ic-mode=dual
>> \
>> -m 4G -accel kvm -cpu POWER9 -smp 1,maxcpus=1,threads=1,cores=1,sockets=1 \
>> -device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=0x2 \
>> -drive
>> file=/home/danielhb/fedora36.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none
>> \
>> -device
>> scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=2
>> \
>> -device qemu-xhci,id=usb,bus=pci.0,addr=0x4 -nographic -display none
>>
>>
>> Guest is running v5.19-rc2 with this series applied. Kernel config consists of
>> 'pseries_le_defconfig' plus the following 'watchdog' related changes:
>>
>> [root@fedora ~]# cat linux/.config | grep PSERIES_WDT
>> CONFIG_PSERIES_WDT=y
>>
>> [root@fedora ~]# cat linux/.config | grep -i watchdog
>> CONFIG_PPC_WATCHDOG=y
>> CONFIG_HAVE_NMI_WATCHDOG=y
>> CONFIG_WATCHDOG=y
>> CONFIG_WATCHDOG_CORE=y
>> CONFIG_WATCHDOG_NOWAYOUT=y
>> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
>> CONFIG_WATCHDOG_OPEN_TIMEOUT=0
>> # CONFIG_WATCHDOG_SYSFS is not set
>> # CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
>> # Watchdog Pretimeout Governors
>> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
>> # Watchdog Device Drivers
>> # CONFIG_SOFT_WATCHDOG is not set
>> # CONFIG_XILINX_WATCHDOG is not set
>> # CONFIG_ZIIRAVE_WATCHDOG is not set
>> # CONFIG_CADENCE_WATCHDOG is not set
>> # CONFIG_DW_WATCHDOG is not set
>> # CONFIG_MAX63XX_WATCHDOG is not set
>> CONFIG_WATCHDOG_RTAS=y
>> # PCI-based Watchdog Cards
>> # CONFIG_PCIPCWATCHDOG is not set
>> # USB-based Watchdog Cards
>> # CONFIG_USBPCWATCHDOG is not set
>> # CONFIG_WQ_WATCHDOG is not set
>> [root@fedora ~]#
>>
>>
>>
>> Kernel command line:
>>
>> [root@fedora ~]# cat /proc/cmdline
>> BOOT_IMAGE=(ieee1275/disk,msdos2)/vmlinuz-5.19.0-rc2-00054-g12ede8ffb103 \
>> root=/dev/mapper/fedora_fedora-root ro rd.lvm.lv=fedora_fedora/root \
>> pseries-wdt.timeout=60 pseries-wdt.nowayout=1 pseries-wdt.action=2
>>
>>
>> With all that, executing
>>
>> echo V > /dev/watchdog0
>>
>> Does nothing. dmesg is clean and the guest doesn't reboot after the 60 sec
>> timeout.  I also tried with PSERIES_WDT being compiled as a module instead
>> of built-in. Same results.
>>
>>
>> What am I missing?
>>
>>
>> [1]
>> https://patchwork.ozlabs.org/project/qemu-ppc/patch/20220608030153.1862335-1-aik@ozlabs.ru/
>>
>>
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>
>>
>> On 6/2/22 14:53, Scott Cheloha wrote:
>>> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  This patch series
>>> adds support for this hypercall to powerpc/pseries kernels and
>>> introduces a new watchdog driver, "pseries-wdt", for the virtual
>>> timers exposed by the hypercall.
>>>
>>> This series is preceded by the following:
>>>
>>> RFC v1:
>>> https://lore.kernel.org/linux-watchdog/20220413165104.179144-1-cheloha@linux.ibm.com/
>>>
>>> RFC v2:
>>> https://lore.kernel.org/linux-watchdog/20220509174357.5448-1-cheloha@linux.ibm.com/
>>>
>>> PATCH v1:
>>> https://lore.kernel.org/linux-watchdog/20220520183552.33426-1-cheloha@linux.ibm.com/
>>>
>>>
>>> Changes of note from PATCH v1:
>>>
>>> - Trim down the large comment documenting the H_WATCHDOG hypercall.
>>>     The comment is likely to rot, so remove anything we aren't using
>>>     and anything overly obvious.
>>>
>>> - Remove any preprocessor definitions not actually used in the module
>>>     right now.  If we want to use other features offered by the hypercall
>>>     we can add them in later.  They're just clutter until then.
>>>
>>> - Simplify the "action" module parameter.  The value is now an index
>>>     into an array of possible timeoutAction values.  This design removes
>>>     the need for the custom get/set methods used in PATCH v1.
>>>
>>>     Now we merely need to check that the "action" value is a valid
>>>     index during pseries_wdt_probe().  Easy.
>>>
>>> - Make the timeoutAction a member of pseries_wdt, "action".  This
>>>     eliminates the use of a global variable during pseries_wdt_start().
>>>
>>> - Use watchdog_init_timeout() idiomatically.  Check its return value
>>>     and error out of pseries_wdt_probe() if it fails.
>>>
>>>
> 
