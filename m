Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2354E7FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 18:45:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP7My5s9bz3bmV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 02:45:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pTgOotLz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pTgOotLz;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP7MB5VtMz3bkH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 02:45:10 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GGU9te028670;
	Thu, 16 Jun 2022 16:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hmhAJDvbUnN56qdBjb6q51rrHEMp0FhSmyk8wyC+8JY=;
 b=pTgOotLzUd/+SNQXpdCiFa8kzVbPTXBde6mzlOf7O0BOfJmlCtVrwDMGwwO9A446PYP/
 Y8JCVCk/VBE8hJE4rT7dv2te/uLSgrOaF2t9gEOPXlaHq5XN5T/j8NbCjWaBBNXTt63Y
 H55DE+ULOYxmo1+0Of73qCtMhb3N8TwD548Zopw9ET5X6gXb56EVZGpD3ZZgpVEclkgn
 s0N7wCx7nNVRKk060QYWrRvPtk1yxGuVyQjoX+74oPAmR2lCl9czj5Y4waGhhadv8Hxu
 tHxsVuCfCHrZ2oh1myqkDYxFarrR+4/arqOOpAMThaHT6yzK5duVHAHLrBrYVnaoPLqv Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gqxe2gqxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 16:45:02 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25GGfGs3006317;
	Thu, 16 Jun 2022 16:45:02 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gqxe2gqx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 16:45:02 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25GGbusG009236;
	Thu, 16 Jun 2022 16:45:01 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma02dal.us.ibm.com with ESMTP id 3gmjpakqg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 16:45:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25GGj0Oi32178482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 16:45:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0886EAC05E;
	Thu, 16 Jun 2022 16:45:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADF2FAC05B;
	Thu, 16 Jun 2022 16:44:57 +0000 (GMT)
Received: from [9.160.59.133] (unknown [9.160.59.133])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jun 2022 16:44:57 +0000 (GMT)
Message-ID: <e5d65186-8247-ac6e-d785-e560f380014a@linux.ibm.com>
Date: Thu, 16 Jun 2022 09:44:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/4] pseries-wdt: initial support for H_WATCHDOG-based
 watchdog timers
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
        Scott Cheloha <cheloha@linux.ibm.com>, linux-watchdog@vger.kernel.org
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <74ac21a1-d56f-50fb-71c2-e800e943f340@gmail.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <74ac21a1-d56f-50fb-71c2-e800e943f340@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RSgseW4hDF64XfyI88HQbIg7F0eSAcW7
X-Proofpoint-ORIG-GUID: tt7LCTADttLQqYolu5Ghu21bZGVnzI_U
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_12,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206160068
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

On 6/15/22 18:43, Daniel Henrique Barboza wrote:
> Hi,
> 
> I tried this series out with mainline QEMU built with Alexey's patch [1]
> and I wasn't able to get it to work. I'm using a simple QEMU command line
> booting a fedora36 guest in a Power9 boston host:

I would assume the H_WATCHDOG hypercall is not implemented by the qemu pseries
machine type. It is a very new hypercall.

-Tyrel

> 
> sudo  ./qemu-system-ppc64 \
> -M
> pseries,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off,ic-mode=dual
> \
> -m 4G -accel kvm -cpu POWER9 -smp 1,maxcpus=1,threads=1,cores=1,sockets=1 \
> -device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=0x2 \
> -drive
> file=/home/danielhb/fedora36.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none
> \
> -device
> scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=2
> \
> -device qemu-xhci,id=usb,bus=pci.0,addr=0x4 -nographic -display none
> 
> 
> Guest is running v5.19-rc2 with this series applied. Kernel config consists of
> 'pseries_le_defconfig' plus the following 'watchdog' related changes:
> 
> [root@fedora ~]# cat linux/.config | grep PSERIES_WDT
> CONFIG_PSERIES_WDT=y
> 
> [root@fedora ~]# cat linux/.config | grep -i watchdog
> CONFIG_PPC_WATCHDOG=y
> CONFIG_HAVE_NMI_WATCHDOG=y
> CONFIG_WATCHDOG=y
> CONFIG_WATCHDOG_CORE=y
> CONFIG_WATCHDOG_NOWAYOUT=y
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
> CONFIG_WATCHDOG_OPEN_TIMEOUT=0
> # CONFIG_WATCHDOG_SYSFS is not set
> # CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
> # Watchdog Pretimeout Governors
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> # Watchdog Device Drivers
> # CONFIG_SOFT_WATCHDOG is not set
> # CONFIG_XILINX_WATCHDOG is not set
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> # CONFIG_CADENCE_WATCHDOG is not set
> # CONFIG_DW_WATCHDOG is not set
> # CONFIG_MAX63XX_WATCHDOG is not set
> CONFIG_WATCHDOG_RTAS=y
> # PCI-based Watchdog Cards
> # CONFIG_PCIPCWATCHDOG is not set
> # USB-based Watchdog Cards
> # CONFIG_USBPCWATCHDOG is not set
> # CONFIG_WQ_WATCHDOG is not set
> [root@fedora ~]#
> 
> 
> 
> Kernel command line:
> 
> [root@fedora ~]# cat /proc/cmdline
> BOOT_IMAGE=(ieee1275/disk,msdos2)/vmlinuz-5.19.0-rc2-00054-g12ede8ffb103 \
> root=/dev/mapper/fedora_fedora-root ro rd.lvm.lv=fedora_fedora/root \
> pseries-wdt.timeout=60 pseries-wdt.nowayout=1 pseries-wdt.action=2
> 
> 
> With all that, executing
> 
> echo V > /dev/watchdog0
> 
> Does nothing. dmesg is clean and the guest doesn't reboot after the 60 sec
> timeout.  I also tried with PSERIES_WDT being compiled as a module instead
> of built-in. Same results.
> 
> 
> What am I missing?
> 
> 
> [1]
> https://patchwork.ozlabs.org/project/qemu-ppc/patch/20220608030153.1862335-1-aik@ozlabs.ru/
> 
> 
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
> 
> On 6/2/22 14:53, Scott Cheloha wrote:
>> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  This patch series
>> adds support for this hypercall to powerpc/pseries kernels and
>> introduces a new watchdog driver, "pseries-wdt", for the virtual
>> timers exposed by the hypercall.
>>
>> This series is preceded by the following:
>>
>> RFC v1:
>> https://lore.kernel.org/linux-watchdog/20220413165104.179144-1-cheloha@linux.ibm.com/
>>
>> RFC v2:
>> https://lore.kernel.org/linux-watchdog/20220509174357.5448-1-cheloha@linux.ibm.com/
>>
>> PATCH v1:
>> https://lore.kernel.org/linux-watchdog/20220520183552.33426-1-cheloha@linux.ibm.com/
>>
>>
>> Changes of note from PATCH v1:
>>
>> - Trim down the large comment documenting the H_WATCHDOG hypercall.
>>    The comment is likely to rot, so remove anything we aren't using
>>    and anything overly obvious.
>>
>> - Remove any preprocessor definitions not actually used in the module
>>    right now.  If we want to use other features offered by the hypercall
>>    we can add them in later.  They're just clutter until then.
>>
>> - Simplify the "action" module parameter.  The value is now an index
>>    into an array of possible timeoutAction values.  This design removes
>>    the need for the custom get/set methods used in PATCH v1.
>>
>>    Now we merely need to check that the "action" value is a valid
>>    index during pseries_wdt_probe().  Easy.
>>
>> - Make the timeoutAction a member of pseries_wdt, "action".  This
>>    eliminates the use of a global variable during pseries_wdt_start().
>>
>> - Use watchdog_init_timeout() idiomatically.  Check its return value
>>    and error out of pseries_wdt_probe() if it fails.
>>
>>

