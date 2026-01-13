Return-Path: <linuxppc-dev+bounces-15611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AC3D16A79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 06:07:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqy0s614lz2xWJ;
	Tue, 13 Jan 2026 16:07:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768280845;
	cv=none; b=F4S8JpjCzjJvmhHOsIkD6dx71ONIsZJyPxBsTkvH2uocMW/derJU2BKlfAQlGQK9ERRPOLSL/Z+MZCkQNfjZS7vaOp5ybE+aOdDkB3g4lq1bEGx7SShe0ti73QkkZngEjlFZb9UblC+scmBqRpvt/lM3oSH2IXl5gjd2m3UdxlB79QqF4J8kfevSpQnxK7+q2kKtOIPZPMoYj1Cw96U1Mz1asIL8iClfPJpOeeeYWZPd5ylyACdEb4f6GmI7rsfry76ufm3NT8xVHz28d6xk7gtH5RxlfOtMM4FXcw4tfYnOE+xGDREOqscyiU3iN7yjsLFWtmyi/g9NndiYm7YiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768280845; c=relaxed/relaxed;
	bh=QUgCviFOLHrYpuKk1qmiorApGr1x+WiVD10w4uzZw0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSloTxd9z6CHZRtFa+KIdSqzAWJvFoq8lIXopMDJqmBkPzYmNDr8kOwrnhugH/44t90u3d0o1XgIQK7nPh9JuzaSNgVsbv9iN5lVjcmt9KagdjeOOLi5Pkmu7Mxe4H7pWFgRaPrY5DzsGbwO5TkrzeB8/+Duo63nJQZfjDXLRTtVergcd3lovzoMI3b7b7qQDJghqGt1ZTeZ/HNDThR3K6QTej4iMiL7FZ0bfbugey1wSgbhlyQMDE6hN9B65oyK7deUjvbs4/Ud/M7dZOMparh1mJXbr3jEFyvFpgewgKMzbbzIotYKz4rm5gOJCcqy4IwMXbJgUCPFbdaNn4ExCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kp4NaELB; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kp4NaELB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqy0r3zWHz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 16:07:23 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60D2A3gu023089
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 05:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QUgCvi
	FOLHrYpuKk1qmiorApGr1x+WiVD10w4uzZw0A=; b=kp4NaELBJMbkWNmrsiYajV
	Vua1G+3GRTJIoWgC5SoOiVX77wIOaqfJvK1XF17u85kC2+E7n52L6O9fvhVjAQpB
	tl7jodgIHeYNBZlD1S12aDQpUqQabrkWQ8+hOXCSuCYYg/EN8wl7K7Sd3ctRpoLi
	iyb7kvw7R1Lzjk9OAigjrcAqY284f5qXXCUZhEoGZ7sYkDL0+z/VbHuQ+z9sPVVS
	CbAATycCLiRVmDuINnZWV4gv9oquBPcfhIJgSeH5CMr2jc5fLS6h4SyPebVI6dGj
	R7bNHyM6elHjIGubHmUWR8/g6aqGM497YKtRAVOQwVYy9CLcTfVp8hERvWXfsT0Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6e2k0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 05:07:20 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60D3hx6S031250
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 05:07:19 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3t1hy8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 05:07:19 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60D57I2k32899718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jan 2026 05:07:18 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7E8858052;
	Tue, 13 Jan 2026 05:07:18 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 056AE58065;
	Tue, 13 Jan 2026 05:07:17 +0000 (GMT)
Received: from [9.98.108.237] (unknown [9.98.108.237])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jan 2026 05:07:16 +0000 (GMT)
Message-ID: <a0ad408a-988b-4baf-84d1-1af4584d8f7f@linux.ibm.com>
Date: Tue, 13 Jan 2026 10:37:15 +0530
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
Subject: Re: [mainline] KDUMP/FADUMP is broken on the mainline kernel on P11
 System
Content-Language: en-GB
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
References: <1dee8891-8bcc-46b4-93f3-fc3a774abd5b@linux.ibm.com>
 <9e1ba7b3-7204-4db8-9876-c1cef20141c9@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <9e1ba7b3-7204-4db8-9876-c1cef20141c9@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LHcQoi3lGC7UTxHvmyZcJX2RZdOllRVx
X-Authority-Analysis: v=2.4 cv=LLxrgZW9 c=1 sm=1 tr=0 ts=6965d308 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=74_OhrOYAAAA:8 a=AFsVlz9-bFb1VpNkZY8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sXAPJFFmzZfmHMDDykbx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAzNyBTYWx0ZWRfX76zuDf5U9Ez6
 LWJiQNOX8VuFVOMSnwj9iTN8xAcsUAOy+7Tgr+wajSawH209VLxSQYacDoXqqz8Ym53vZfwWgX5
 PbdMgyBWx6ndJk5unolVlmF+BBSwBsgMVflPIwmczQgnY88L5RV4ak643GbA7Rf/XCHiDyv4wn/
 VMotSthtE+8r5W1neErSrg0eO5hE8jtDrBZxDsEikm8M5s9gp/eNOFaWIrxgedrIH+ieCE4jfX0
 6SLbmRJettP1GjlRTPKeJvoerAqgLalcTpg83hNUq8Msan7QwevMrywxBV8PKmMqYcJltvRqOQc
 bXTalL/Ckhpwy+dhkCytY067Bt8PKwdy2kmONOM/xczN++Y8bGGRRmkzUPAJdfT1TqDXNfKNSjk
 OVVs/Prd2LYLOy1v9Nh8D8QP2CKYYil1wUZhlFz9x4vnc4Y8Vg0I0ADwAPkCza/Uw4+AUL1fmds
 lV5AHgdBWuW+qH7OOrw==
X-Proofpoint-ORIG-GUID: LHcQoi3lGC7UTxHvmyZcJX2RZdOllRVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601130037
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 12/01/26 3:34 pm, Sourabh Jain wrote:
> Hello Venkat,
>
> Thanks for sharing the bug report.
>
> Can you please provide additional data about the environment.
>
> 1. What was the top commit in your git branch?
> 2. Kernel command-line of first/production kernel.
> 3. Is this issue specific to P11?
> 4. Since you used kdump service to load the capture kernel may I know 
> what distro was used?


1. commit-id: 0f61b1860cc3f52aef9036d7235ed1f017632193

2. cat /proc/cmdline
BOOT_IMAGE=(ieee1275//vdevice/v-scsi@30000069/disk@8100000000000000,msdos3)/boot/vmlinuz-6.19.0-rc5 
root=UUID=6a163e3c-3a88-4cc6-800d-8d037bd4f0b0 ro 
  crashkernel=2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G

3. Yes, on P9, its working.

4. "Red Hat Enterprise Linux 9.5 Beta (Plow)"

>
>
> On 12/01/26 08:51, Venkat Rao Bagalkote wrote:
>> Greetings!!
>>
>>
>> KDUMP and FADUMP is broken on P11 system. After configuring 
>> KDUMP/FADUMP on the system, upon reboot, system dosent reboot to 
>> collect the vmcore. Its just stuck. Need to trigger reboot from HMC.
>
> What do you mean upon reboot? Did you on system crash?

Sorry, my bad. Upon triggering crash, system doesnt reboot to collect 
the vmcore.

>
>>
>>
>>
>> # makedumpfile -v
>> makedumpfile: version 1.7.7 (released on 21 Apr 2025)
>> lzo    enabled
>> snappy    enabled
>> zstd    disabled
>>
>> cd /root/
>> # makedumpfile -v
>> makedumpfile: version 1.7.7 (released on 21 Apr 2025)
>> lzo    enabled
>> snappy    enabled
>> zstd    disabled
>>
>> # systemctl stop kdump.service
>> # systemctl start kdump.service
>>  systemctl status kdump.service --no-pager
>> ● kdump.service - Crash recovery kernel arming
>>      Loaded: loaded (/usr/lib/systemd/system/kdump.service; enabled; 
>> preset: enabled)
>>      Active: active (exited) since Fri 2026-01-09 09:12:01 CST; 7s ago
>>     Process: 2071 ExecStart=/usr/bin/kdumpctl start (code=exited, 
>> status=0/SUCCESS)
>>    Main PID: 2071 (code=exited, status=0/SUCCESS)
>>         CPU: 41.857s
>>
>> Jan 09 09:11:55 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
>> Install squash…**
>> Jan 09 09:11:56 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
>> Stripping file…**
>> Jan 09 09:11:56 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
>> Stripping file…**
>> Jan 09 09:11:56 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
>> Squashing the …**
>> Jan 09 09:11:58 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
>> Squashing the …**
>> Jan 09 09:11:58 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
>> Creating image…**
>> Jan 09 09:11:58 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
>> Creating initr…**
>> Jan 09 09:12:01 ltcden8-lp5.ltc.tadn.ibm.com kdumpctl[2074]: kdump: 
>> kexec: lo…el
>> Jan 09 09:12:01 ltcden8-lp5.ltc.tadn.ibm.com kdumpctl[2074]: kdump: 
>> Starting …K]
>> Jan 09 09:12:01 ltcden8-lp5.ltc.tadn.ibm.com systemd[1]: Finished 
>> Crash recov…g.
>> Hint: Some lines were ellipsized, use -l to show in full.
>> # echo 10 > /proc/sys/kernel/panic
>> # echo 1 > /proc/sys/kernel/sysrq
>> # echo c > /proc/sysrq-trigger
>> [  595.605706] sysrq: Trigger a crash
>> [  595.605721] Kernel panic - not syncing: sysrq triggered crash
>> [  595.605729] CPU: 0 UID: 0 PID: 1840 Comm: bash Kdump: loaded Not 
>> tainted 6.17.0 #6 VOLUNTARY
>> [  595.605739] Hardware name: IBM,9080-HEX Power11 (architected) 
>> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
>> [  595.605747] Call Trace:
>> [  595.605752] [c0000000a0e17920] [c00000000184c0e8] 
>> dump_stack_lvl+0xd0/0xe8 (unreliable)
>> [  595.605769] [c0000000a0e17950] [c0000000001b2434] vpanic+0x498/0x518
>> [  595.605781] [c0000000a0e17a00] [c0000000001b2504] nmi_panic+0x0/0x13c
>> [  595.605791] [c0000000a0e17a20] [c000000000e95d8c] 
>> sysrq_handle_crash+0x30/0x34
>> [  595.605804] [c0000000a0e17a80] [c000000000e96c98] 
>> __handle_sysrq+0x124/0x384
>> [  595.605814] [c0000000a0e17b40] [c000000000e97a9c] 
>> write_sysrq_trigger+0x184/0x228
>> [  595.605826] [c0000000a0e17bc0] [c0000000009f1c54] 
>> proc_reg_write+0x18c/0x240
>> [  595.605838] [c0000000a0e17c10] [c000000000896588] 
>> vfs_write+0x148/0x7d8
>> [  595.605848] [c0000000a0e17cf0] [c000000000896eb4] 
>> ksys_write+0xa0/0x184
>> [  595.605858] [c0000000a0e17d50] [c0000000000393d0] 
>> system_call_exception+0x1e0/0x460
>> [  595.605869] [c0000000a0e17e50] [c00000000000d05c] 
>> system_call_vectored_common+0x15c/0x2ec
>> [  595.605882] ---- interrupt: 3000 at 0x7fff9ab33e74
>> [  595.605890] NIP:  00007fff9ab33e74 LR: 00007fff9ab33e74 CTR: 
>> 0000000000000000
>> [  595.605897] REGS: c0000000a0e17e80 TRAP: 3000   Not tainted (6.17.0)
>> [  595.605904] MSR:  800000000280f033 
>> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44422408  XER: 00000000
>> [  595.605936] IRQMASK: 0
>> [  595.605936] GPR00: 0000000000000004 00007fffc3c7fab0 
>> 0000000135727e00 0000000000000001
>> [  595.605936] GPR04: 000000014b93c040 0000000000000002 
>> 0000000000000010 0000000000000001
>> [  595.605936] GPR08: 0000000000000001 0000000000000000 
>> 0000000000000000 0000000000000000
>> [  595.605936] GPR12: 0000000000000000 00007fff9adfab60 
>> 000000014b9fc1d0 00000001357287b8
>> [  595.605936] GPR16: 00000001357294d8 0000000020000000 
>> 0000000000000000 0000000135639070
>> [  595.605936] GPR20: 00000001356cbeb8 00007fffc3c7fc54 
>> 00000001356cf8a0 00000001357289bc
>> [  595.605936] GPR24: 0000000135728a50 0000000000000000 
>> 000000014b93c040 0000000000000002
>> [  595.605936] GPR28: 0000000000000002 00007fff9ac318e0 
>> 000000014b93c040 0000000000000002
>> [  595.606034] NIP [00007fff9ab33e74] 0x7fff9ab33e74
>> [  595.606040] LR [00007fff9ab33e74] 0x7fff9ab33e74
>> [  595.606046] ---- interrupt: 3000
>> 8:41
>> # cat /etc/kdump.conf
>> # This file contains a series of commands to perform (in order) in 
>> the kdump
>> # kernel after a kernel crash in the crash kernel(1st kernel) has 
>> happened.
>> #
>> # Directives in this file are only applicable to the kdump initramfs, 
>> and have
>> # no effect once the root filesystem is mounted and the normal init 
>> scripts are
>> # processed.
>> #
>> # Currently, only one dump target and path can be specified.  If the 
>> dumping to
>> # the configured target fails, the failure action which can be 
>> configured via
>> # the "failure_action" directive will be performed.
>> #
>> # Supported options:
>> #
>> # auto_reset_crashkernel <yes|no>
>> #           - whether to reset kernel crashkernel to new default value
>> #             or not when kexec-tools updates the default crashkernel 
>> value and
>> #             existing kernels using the old default kernel 
>> crashkernel value.
>> #             The default value is yes.
>> #
>> # raw <partition>
>> #           - Will dd /proc/vmcore into <partition>.
>> #             Use persistent device names for partition devices,
>> #             such as /dev/vg/<devname>.
>> #
>> # nfs <nfs mount>
>> #           - Will mount nfs to <mnt>, and copy /proc/vmcore to
>> #             <mnt>/<path>/%HOST-%DATE/, supports DNS.
>> #
>> # ssh <user@server>
>> #           - Will save /proc/vmcore to 
>> <user@server>:<path>/%HOST-%DATE/,
>> #             supports DNS.
>> #             NOTE: make sure the user has write permissions on the 
>> server.
>> #
>> # sshkey <path>
>> #           - Will use the sshkey to do ssh dump.
>> #             Specify the path of the ssh key to use when dumping
>> #             via ssh. The default value is /root/.ssh/kdump_id_rsa.
>> #
>> # <fs type> <partition>
>> #           - Will mount -t <fs type> <partition> <mnt>, and copy
>> #             /proc/vmcore to <mnt>/<path>/%HOST_IP-%DATE/.
>> #             NOTE: <partition> can be a device node, label or uuid.
>> #             It's recommended to use persistent device names
>> #             such as /dev/vg/<devname>.
>> #             Otherwise it's suggested to use label or uuid.
>> #             Supported fs types: ext[234], xfs, btrfs, minix, virtiofs
>> #
>> # path <path>
>> #           - "path" represents the file system path in which vmcore
>> #             will be saved.  If a dump target is specified in
>> #             kdump.conf, then "path" is relative to the specified
>> #             dump target.
>> #
>> #             Interpretation of "path" changes a bit if the user didn't
>> #             specify any dump target explicitly in kdump.conf. In this
>> #             case, "path" represents the absolute path from root. The
>> #             dump target and adjusted path are arrived at automatically
>> #             depending on what's mounted in the current system.
>> #
>> #             Ignored for raw device dumps.  If unset, will use the 
>> default
>> #             "/var/crash".
>> #
>> # core_collector <command> <options>
>> #           - This allows you to specify the command to copy
>> #             the vmcore.  The default is makedumpfile, which on
>> #             some architectures can drastically reduce vmcore size.
>> #             See /sbin/makedumpfile --help for a list of options.
>> #             Note that the -i and -g options are not needed here,
>> #             as the initrd will automatically be populated with a
>> #             config file appropriate for the running kernel.
>> #             The default core_collector for raw/ssh dump is:
>> #             "makedumpfile -F -l --message-level 7 -d 31".
>> #             The default core_collector for other targets is:
>> #             "makedumpfile -l --message-level 7 -d 31".
>> #
>> #             "makedumpfile -F" will create a flattened vmcore.
>> #             You need to use "makedumpfile -R" to rearrange the dump 
>> data to
>> #             a normal dumpfile readable with analysis tools. For 
>> example:
>> #             "makedumpfile -R vmcore < vmcore.flat".
>> #
>> #             For core_collector format details, you can refer to
>> #             kexec-kdump-howto.txt or kdump.conf manpage.
>> #
>> # kdump_post <binary | script>
>> #           - This directive allows you to run a executable binary
>> #             or script after the vmcore dump process terminates.
>> #             The exit status of the current dump process is fed to
>> #             the executable binary or script as its first argument.
>> #             All files under /etc/kdump/post.d are collectively sorted
>> #             and executed in lexical order, before binary or script
>> #             specified kdump_post parameter is executed.
>> #
>> # kdump_pre <binary | script>
>> #           - Works like the "kdump_post" directive, but instead of 
>> running
>> #             after the dump process, runs immediately before it.
>> #             Exit status of this binary is interpreted as follows:
>> #               0 - continue with dump process as usual
>> #               non 0 - run the final action (reboot/poweroff/halt)
>> #             All files under /etc/kdump/pre.d are collectively 
>> sorted and
>> #             executed in lexical order, after binary or script 
>> specified
>> #             kdump_pre parameter is executed.
>> #             Even if the binary or script in /etc/kdump/pre.d directory
>> #             returns non 0 exit status, the processing is continued.
>> #
>> # extra_bins <binaries | shell scripts>
>> #           - This directive allows you to specify additional 
>> binaries or
>> #             shell scripts to be included in the kdump initrd.
>> #             Generally they are useful in conjunction with a kdump_post
>> #             or kdump_pre binary or script which depends on these 
>> extra_bins.
>> #
>> # extra_modules <module(s)>
>> #           - This directive allows you to specify extra kernel modules
>> #             that you want to be loaded in the kdump initrd.
>> #             Multiple modules can be listed, separated by spaces, 
>> and any
>> #             dependent modules will automatically be included.
>> #
>> # failure_action <reboot | halt | poweroff | shell | dump_to_rootfs>
>> #           - Action to perform in case dumping fails.
>> #             reboot:   Reboot the system.
>> #             halt:     Halt the system.
>> #             poweroff: Power down the system.
>> #             shell:    Drop to a bash shell.
>> #                       Exiting the shell reboots the system by default,
>> #                       or perform "final_action".
>> #             dump_to_rootfs:  Dump vmcore to rootfs from initramfs 
>> context and
>> #                       reboot by default or perform "final_action".
>> #                       Useful when non-root dump target is specified.
>> #             The default option is "reboot".
>> #
>> # default <reboot | halt | poweroff | shell | dump_to_rootfs>
>> #           - Same as the "failure_action" directive above, but this 
>> directive
>> #             is obsolete and will be removed in the future.
>> #
>> # final_action <reboot | halt | poweroff>
>> #           - Action to perform in case dumping succeeds. Also performed
>> #             when "shell" or "dump_to_rootfs" failure action finishes.
>> #             Each action is same as the "failure_action" directive 
>> above.
>> #             The default is "reboot".
>> #
>> # force_rebuild <0 | 1>
>> #           - By default, kdump initrd will only be rebuilt when 
>> necessary.
>> #             Specify 1 to force rebuilding kdump initrd every time 
>> when kdump
>> #             service starts.
>> #
>> # force_no_rebuild <0 | 1>
>> #           - By default, kdump initrd will be rebuilt when necessary.
>> #             Specify 1 to bypass rebuilding of kdump initrd.
>> #
>> #             force_no_rebuild and force_rebuild options are mutually
>> #             exclusive and they should not be set to 1 simultaneously.
>> #
>> # override_resettable <0 | 1>
>> #           - Usually an unresettable block device can't be a dump 
>> target.
>> #             Specifying 1 when you want to dump even though the block
>> #             target is unresettable
>> #             By default, it is 0, which will not try dumping 
>> destined to fail.
>> #
>> # dracut_args <arg(s)>
>> #           - Pass extra dracut options when rebuilding kdump initrd.
>> #
>> # fence_kdump_args <arg(s)>
>> #           - Command line arguments for fence_kdump_send (it can 
>> contain
>> #             all valid arguments except hosts to send notification to).
>> #
>> # fence_kdump_nodes <node(s)>
>> #           - List of cluster node(s) except localhost, separated by 
>> spaces,
>> #             to send fence_kdump notifications to.
>> #             (this option is mandatory to enable fence_kdump).
>> #
>>
>> #raw /dev/vg/lv_kdump
>> #ext4 /dev/vg/lv_kdump
>> #ext4 LABEL=/boot
>> #ext4 UUID=03138356-5e61-4ab3-b58e-27507ac41937
>> #virtiofs myfs
>> #nfs my.server.com:/export/tmp
>> #nfs [2001:db8::1:2:3:4]:/export/tmp
>> #ssh user@my.server.com
>> #ssh user@2001:db8::1:2:3:4
>> #sshkey /root/.ssh/kdump_id_rsa
>> auto_reset_crashkernel yes
>> path /var/crash
>> core_collector makedumpfile -l --message-level 7 -d 31
>> #core_collector scp
>> #kdump_post /var/crash/scripts/kdump-post.sh
>> #kdump_pre /var/crash/scripts/kdump-pre.sh
>> #extra_bins /usr/bin/lftp
>> #extra_modules gfs2
>> #failure_action shell
>> #force_rebuild 1
>> #force_no_rebuild 1
>> #dracut_args --omit-drivers "cfg80211 snd" --add-drivers "ext2 ext3"
>> #fence_kdump_args -p 7410 -f auto -c 0 -i 10
>> #fence_kdump_nodes node1 node2
>>
>>
>>
>> Regards,
>>
>> Venkat.
>>
>

