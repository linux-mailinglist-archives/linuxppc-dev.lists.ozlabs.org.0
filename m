Return-Path: <linuxppc-dev+bounces-15538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88819D1262A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 12:48:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqVyT0sgpz307V;
	Mon, 12 Jan 2026 22:48:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768218529;
	cv=none; b=g+LXzt4jI9DDxUqp9Oh6WMf7J+2Ex44iz63/XFMkCSAC/Yoi1fHaFWWONCwNwLLsHQuqCcqcVBYq19o5LY3ULwtWgFdNPwaWfOSbgg0x/GtMcmgMcyp2ZHJqEmq+sXTdbdheikx6ZwoGPeNHEbVOMiZ84/iWHNixN+TkX0slp4JTe5u6bTCPXqCxOgtu7+NoDBhuBO2M2wEL1y7I6ISErDPsT0pYF/6jHc5NfObVyhvfcLCIwPb9IR5fIkRzXR1MM7biPMx/nxP13VvMy+X86y2w9lYad3VXS9RzJn3XsqeC7g6os6wopDfjam60jPWcgZxKvmeOjErAqfSV0w+gGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768218529; c=relaxed/relaxed;
	bh=VbkAcZ3qiTzfb0uHYTaNQOLzQGgzqKDcvS02Wd8jnEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQNksChVfrbO9dQvMIWdgse98CFXZu2Je0aoGrgiciK/bxze1mvriGyCD2LrxgAwT4nLljWX3GEcfA4DH6uEhULnU7UtEnEyvQavpYTf0zdGYpXfAr7Uu311TRfNZYaD19el7Tb2b/LAVngFDVGLgYbR3tPu8eeRShURFiUUoMNBSVPPlXcst62SLaYA/tbGCzMjHM6IF9/R/mcKDVJW4W09lWreX/zyZrYMg2deYu8PIRRE9p5/Io0tzdCUHJvRqqwK3ziRe9tf4nBVBIa3zCTRd4cujpygmx0kXmdHdZiBbnwK5o2zPucn5uStlts7cryBTtGfOTt3ztK6jFKZuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V4zVZXcv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V4zVZXcv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqVyS1Vsrz2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 22:48:47 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60B9s0ox024310
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 10:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VbkAcZ
	3qiTzfb0uHYTaNQOLzQGgzqKDcvS02Wd8jnEQ=; b=V4zVZXcvw89W+4bAx4RWyX
	p0NbZDTI5k4YIWb7wfgd/sXziSOVksnW3SLIeUzzkWLOK9Mwc61NWKSN5t2B0w6S
	NCfuBlOTtjbfmqo19d6h2/WS5NyCJXtFhMcRnG+WINgg7k7M6ZqfUHIkFJz99laH
	tq52qHXWyABVZl34zWroph0bRXjtbbL/6Cfn8GjR7WOGaP5p76YWgy9HcWW4FjJw
	kA00UOZzKqIo4Q1q8mgKxRX3OmUA9rQg8ivWEbaCGHtyhvHt/S9KRv8XcRDLvqbi
	ZVJUvMwb2/t+BD3sxQWhKcNtEsqizg9v/OPz91LoDOr9XSY+KJxeSLotgWDQbLrw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkeg46e4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 10:04:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60C6iGgX030153
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 10:04:49 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3ajd3jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 10:04:49 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60CA4jYP50594062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jan 2026 10:04:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75FBB2005A;
	Mon, 12 Jan 2026 10:04:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74D4420063;
	Mon, 12 Jan 2026 10:04:44 +0000 (GMT)
Received: from [9.39.17.193] (unknown [9.39.17.193])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Jan 2026 10:04:44 +0000 (GMT)
Message-ID: <9e1ba7b3-7204-4db8-9876-c1cef20141c9@linux.ibm.com>
Date: Mon, 12 Jan 2026 15:34:01 +0530
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
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
References: <1dee8891-8bcc-46b4-93f3-fc3a774abd5b@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <1dee8891-8bcc-46b4-93f3-fc3a774abd5b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3NyBTYWx0ZWRfX9CikItoHKUK2
 utlQDR9Io1v6r3Y281bwcYQaoGs7lZekFzOGKE0zL1Euf62oB75OL8Kzzg3wz1N+eBUN9s/2AIj
 +mvvkLaUYHrfIwIR2MoIw+qqOkhykKS3+m5wzIMgPYjtSTfTuIpabMDJADaRqcj5gV6ztRQPFBu
 yZ0VPc7O3R0kgs6UxGED8jlswgvRNPHMi6rJlXKOCC+iU+nIpnhkETLypb2+D7wJZtEtRvT29+i
 gMBOaAGootXIJAS/i/r4LKo1en9gw516i6lfFsxy41TAts5yL2cCGB+u42jaH4h2WwLucrbmjva
 s5J343IWipmc2Q/HAEMLsf3xy7Pwonm+s/AfRXpzFFklh6ZGaXNcdQWDvfD2+dAPRLL5FqEFu1i
 TX+bBNrd+hnGxaZOGhdkSmkS9WcHipvSXBH3MJjqBYpAVICdCjyLt59PuIZ0TDdj2ak5odTFxTS
 C5BPAp2jlWvFa5+J6Aw==
X-Proofpoint-ORIG-GUID: Ak-oIcgInfUHMw0u8S8YYFJG7iaxx9H6
X-Authority-Analysis: v=2.4 cv=B/60EetM c=1 sm=1 tr=0 ts=6964c742 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=74_OhrOYAAAA:8 a=2b986dJOIsQKIj1_7CgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sXAPJFFmzZfmHMDDykbx:22
X-Proofpoint-GUID: Ak-oIcgInfUHMw0u8S8YYFJG7iaxx9H6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601120077
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Venkat,

Thanks for sharing the bug report.

Can you please provide additional data about the environment.

1. What was the top commit in your git branch?
2. Kernel command-line of first/production kernel.
3. Is this issue specific to P11?
4. Since you used kdump service to load the capture kernel may I know 
what distro was used?


On 12/01/26 08:51, Venkat Rao Bagalkote wrote:
> Greetings!!
>
>
> KDUMP and FADUMP is broken on P11 system. After configuring 
> KDUMP/FADUMP on the system, upon reboot, system dosent reboot to 
> collect the vmcore. Its just stuck. Need to trigger reboot from HMC.

What do you mean upon reboot? Did you on system crash?

>
>
>
> # makedumpfile -v
> makedumpfile: version 1.7.7 (released on 21 Apr 2025)
> lzo    enabled
> snappy    enabled
> zstd    disabled
>
> cd /root/
> # makedumpfile -v
> makedumpfile: version 1.7.7 (released on 21 Apr 2025)
> lzo    enabled
> snappy    enabled
> zstd    disabled
>
> # systemctl stop kdump.service
> # systemctl start kdump.service
>  systemctl status kdump.service --no-pager
> ● kdump.service - Crash recovery kernel arming
>      Loaded: loaded (/usr/lib/systemd/system/kdump.service; enabled; 
> preset: enabled)
>      Active: active (exited) since Fri 2026-01-09 09:12:01 CST; 7s ago
>     Process: 2071 ExecStart=/usr/bin/kdumpctl start (code=exited, 
> status=0/SUCCESS)
>    Main PID: 2071 (code=exited, status=0/SUCCESS)
>         CPU: 41.857s
>
> Jan 09 09:11:55 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** Install 
> squash…**
> Jan 09 09:11:56 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
> Stripping file…**
> Jan 09 09:11:56 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
> Stripping file…**
> Jan 09 09:11:56 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
> Squashing the …**
> Jan 09 09:11:58 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
> Squashing the …**
> Jan 09 09:11:58 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
> Creating image…**
> Jan 09 09:11:58 ltcden8-lp5.ltc.tadn.ibm.com dracut[2839]: *** 
> Creating initr…**
> Jan 09 09:12:01 ltcden8-lp5.ltc.tadn.ibm.com kdumpctl[2074]: kdump: 
> kexec: lo…el
> Jan 09 09:12:01 ltcden8-lp5.ltc.tadn.ibm.com kdumpctl[2074]: kdump: 
> Starting …K]
> Jan 09 09:12:01 ltcden8-lp5.ltc.tadn.ibm.com systemd[1]: Finished 
> Crash recov…g.
> Hint: Some lines were ellipsized, use -l to show in full.
> # echo 10 > /proc/sys/kernel/panic
> # echo 1 > /proc/sys/kernel/sysrq
> # echo c > /proc/sysrq-trigger
> [  595.605706] sysrq: Trigger a crash
> [  595.605721] Kernel panic - not syncing: sysrq triggered crash
> [  595.605729] CPU: 0 UID: 0 PID: 1840 Comm: bash Kdump: loaded Not 
> tainted 6.17.0 #6 VOLUNTARY
> [  595.605739] Hardware name: IBM,9080-HEX Power11 (architected) 
> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> [  595.605747] Call Trace:
> [  595.605752] [c0000000a0e17920] [c00000000184c0e8] 
> dump_stack_lvl+0xd0/0xe8 (unreliable)
> [  595.605769] [c0000000a0e17950] [c0000000001b2434] vpanic+0x498/0x518
> [  595.605781] [c0000000a0e17a00] [c0000000001b2504] nmi_panic+0x0/0x13c
> [  595.605791] [c0000000a0e17a20] [c000000000e95d8c] 
> sysrq_handle_crash+0x30/0x34
> [  595.605804] [c0000000a0e17a80] [c000000000e96c98] 
> __handle_sysrq+0x124/0x384
> [  595.605814] [c0000000a0e17b40] [c000000000e97a9c] 
> write_sysrq_trigger+0x184/0x228
> [  595.605826] [c0000000a0e17bc0] [c0000000009f1c54] 
> proc_reg_write+0x18c/0x240
> [  595.605838] [c0000000a0e17c10] [c000000000896588] 
> vfs_write+0x148/0x7d8
> [  595.605848] [c0000000a0e17cf0] [c000000000896eb4] 
> ksys_write+0xa0/0x184
> [  595.605858] [c0000000a0e17d50] [c0000000000393d0] 
> system_call_exception+0x1e0/0x460
> [  595.605869] [c0000000a0e17e50] [c00000000000d05c] 
> system_call_vectored_common+0x15c/0x2ec
> [  595.605882] ---- interrupt: 3000 at 0x7fff9ab33e74
> [  595.605890] NIP:  00007fff9ab33e74 LR: 00007fff9ab33e74 CTR: 
> 0000000000000000
> [  595.605897] REGS: c0000000a0e17e80 TRAP: 3000   Not tainted (6.17.0)
> [  595.605904] MSR:  800000000280f033 
> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44422408  XER: 00000000
> [  595.605936] IRQMASK: 0
> [  595.605936] GPR00: 0000000000000004 00007fffc3c7fab0 
> 0000000135727e00 0000000000000001
> [  595.605936] GPR04: 000000014b93c040 0000000000000002 
> 0000000000000010 0000000000000001
> [  595.605936] GPR08: 0000000000000001 0000000000000000 
> 0000000000000000 0000000000000000
> [  595.605936] GPR12: 0000000000000000 00007fff9adfab60 
> 000000014b9fc1d0 00000001357287b8
> [  595.605936] GPR16: 00000001357294d8 0000000020000000 
> 0000000000000000 0000000135639070
> [  595.605936] GPR20: 00000001356cbeb8 00007fffc3c7fc54 
> 00000001356cf8a0 00000001357289bc
> [  595.605936] GPR24: 0000000135728a50 0000000000000000 
> 000000014b93c040 0000000000000002
> [  595.605936] GPR28: 0000000000000002 00007fff9ac318e0 
> 000000014b93c040 0000000000000002
> [  595.606034] NIP [00007fff9ab33e74] 0x7fff9ab33e74
> [  595.606040] LR [00007fff9ab33e74] 0x7fff9ab33e74
> [  595.606046] ---- interrupt: 3000
> 8:41
> # cat /etc/kdump.conf
> # This file contains a series of commands to perform (in order) in the 
> kdump
> # kernel after a kernel crash in the crash kernel(1st kernel) has 
> happened.
> #
> # Directives in this file are only applicable to the kdump initramfs, 
> and have
> # no effect once the root filesystem is mounted and the normal init 
> scripts are
> # processed.
> #
> # Currently, only one dump target and path can be specified.  If the 
> dumping to
> # the configured target fails, the failure action which can be 
> configured via
> # the "failure_action" directive will be performed.
> #
> # Supported options:
> #
> # auto_reset_crashkernel <yes|no>
> #           - whether to reset kernel crashkernel to new default value
> #             or not when kexec-tools updates the default crashkernel 
> value and
> #             existing kernels using the old default kernel 
> crashkernel value.
> #             The default value is yes.
> #
> # raw <partition>
> #           - Will dd /proc/vmcore into <partition>.
> #             Use persistent device names for partition devices,
> #             such as /dev/vg/<devname>.
> #
> # nfs <nfs mount>
> #           - Will mount nfs to <mnt>, and copy /proc/vmcore to
> #             <mnt>/<path>/%HOST-%DATE/, supports DNS.
> #
> # ssh <user@server>
> #           - Will save /proc/vmcore to 
> <user@server>:<path>/%HOST-%DATE/,
> #             supports DNS.
> #             NOTE: make sure the user has write permissions on the 
> server.
> #
> # sshkey <path>
> #           - Will use the sshkey to do ssh dump.
> #             Specify the path of the ssh key to use when dumping
> #             via ssh. The default value is /root/.ssh/kdump_id_rsa.
> #
> # <fs type> <partition>
> #           - Will mount -t <fs type> <partition> <mnt>, and copy
> #             /proc/vmcore to <mnt>/<path>/%HOST_IP-%DATE/.
> #             NOTE: <partition> can be a device node, label or uuid.
> #             It's recommended to use persistent device names
> #             such as /dev/vg/<devname>.
> #             Otherwise it's suggested to use label or uuid.
> #             Supported fs types: ext[234], xfs, btrfs, minix, virtiofs
> #
> # path <path>
> #           - "path" represents the file system path in which vmcore
> #             will be saved.  If a dump target is specified in
> #             kdump.conf, then "path" is relative to the specified
> #             dump target.
> #
> #             Interpretation of "path" changes a bit if the user didn't
> #             specify any dump target explicitly in kdump.conf. In this
> #             case, "path" represents the absolute path from root. The
> #             dump target and adjusted path are arrived at automatically
> #             depending on what's mounted in the current system.
> #
> #             Ignored for raw device dumps.  If unset, will use the 
> default
> #             "/var/crash".
> #
> # core_collector <command> <options>
> #           - This allows you to specify the command to copy
> #             the vmcore.  The default is makedumpfile, which on
> #             some architectures can drastically reduce vmcore size.
> #             See /sbin/makedumpfile --help for a list of options.
> #             Note that the -i and -g options are not needed here,
> #             as the initrd will automatically be populated with a
> #             config file appropriate for the running kernel.
> #             The default core_collector for raw/ssh dump is:
> #             "makedumpfile -F -l --message-level 7 -d 31".
> #             The default core_collector for other targets is:
> #             "makedumpfile -l --message-level 7 -d 31".
> #
> #             "makedumpfile -F" will create a flattened vmcore.
> #             You need to use "makedumpfile -R" to rearrange the dump 
> data to
> #             a normal dumpfile readable with analysis tools.  For 
> example:
> #             "makedumpfile -R vmcore < vmcore.flat".
> #
> #             For core_collector format details, you can refer to
> #             kexec-kdump-howto.txt or kdump.conf manpage.
> #
> # kdump_post <binary | script>
> #           - This directive allows you to run a executable binary
> #             or script after the vmcore dump process terminates.
> #             The exit status of the current dump process is fed to
> #             the executable binary or script as its first argument.
> #             All files under /etc/kdump/post.d are collectively sorted
> #             and executed in lexical order, before binary or script
> #             specified kdump_post parameter is executed.
> #
> # kdump_pre <binary | script>
> #           - Works like the "kdump_post" directive, but instead of 
> running
> #             after the dump process, runs immediately before it.
> #             Exit status of this binary is interpreted as follows:
> #               0 - continue with dump process as usual
> #               non 0 - run the final action (reboot/poweroff/halt)
> #             All files under /etc/kdump/pre.d are collectively sorted 
> and
> #             executed in lexical order, after binary or script specified
> #             kdump_pre parameter is executed.
> #             Even if the binary or script in /etc/kdump/pre.d directory
> #             returns non 0 exit status, the processing is continued.
> #
> # extra_bins <binaries | shell scripts>
> #           - This directive allows you to specify additional binaries or
> #             shell scripts to be included in the kdump initrd.
> #             Generally they are useful in conjunction with a kdump_post
> #             or kdump_pre binary or script which depends on these 
> extra_bins.
> #
> # extra_modules <module(s)>
> #           - This directive allows you to specify extra kernel modules
> #             that you want to be loaded in the kdump initrd.
> #             Multiple modules can be listed, separated by spaces, and 
> any
> #             dependent modules will automatically be included.
> #
> # failure_action <reboot | halt | poweroff | shell | dump_to_rootfs>
> #           - Action to perform in case dumping fails.
> #             reboot:   Reboot the system.
> #             halt:     Halt the system.
> #             poweroff: Power down the system.
> #             shell:    Drop to a bash shell.
> #                       Exiting the shell reboots the system by default,
> #                       or perform "final_action".
> #             dump_to_rootfs:  Dump vmcore to rootfs from initramfs 
> context and
> #                       reboot by default or perform "final_action".
> #                       Useful when non-root dump target is specified.
> #             The default option is "reboot".
> #
> # default <reboot | halt | poweroff | shell | dump_to_rootfs>
> #           - Same as the "failure_action" directive above, but this 
> directive
> #             is obsolete and will be removed in the future.
> #
> # final_action <reboot | halt | poweroff>
> #           - Action to perform in case dumping succeeds. Also performed
> #             when "shell" or "dump_to_rootfs" failure action finishes.
> #             Each action is same as the "failure_action" directive 
> above.
> #             The default is "reboot".
> #
> # force_rebuild <0 | 1>
> #           - By default, kdump initrd will only be rebuilt when 
> necessary.
> #             Specify 1 to force rebuilding kdump initrd every time 
> when kdump
> #             service starts.
> #
> # force_no_rebuild <0 | 1>
> #           - By default, kdump initrd will be rebuilt when necessary.
> #             Specify 1 to bypass rebuilding of kdump initrd.
> #
> #             force_no_rebuild and force_rebuild options are mutually
> #             exclusive and they should not be set to 1 simultaneously.
> #
> # override_resettable <0 | 1>
> #           - Usually an unresettable block device can't be a dump 
> target.
> #             Specifying 1 when you want to dump even though the block
> #             target is unresettable
> #             By default, it is 0, which will not try dumping destined 
> to fail.
> #
> # dracut_args <arg(s)>
> #           - Pass extra dracut options when rebuilding kdump initrd.
> #
> # fence_kdump_args <arg(s)>
> #           - Command line arguments for fence_kdump_send (it can contain
> #             all valid arguments except hosts to send notification to).
> #
> # fence_kdump_nodes <node(s)>
> #           - List of cluster node(s) except localhost, separated by 
> spaces,
> #             to send fence_kdump notifications to.
> #             (this option is mandatory to enable fence_kdump).
> #
>
> #raw /dev/vg/lv_kdump
> #ext4 /dev/vg/lv_kdump
> #ext4 LABEL=/boot
> #ext4 UUID=03138356-5e61-4ab3-b58e-27507ac41937
> #virtiofs myfs
> #nfs my.server.com:/export/tmp
> #nfs [2001:db8::1:2:3:4]:/export/tmp
> #ssh user@my.server.com
> #ssh user@2001:db8::1:2:3:4
> #sshkey /root/.ssh/kdump_id_rsa
> auto_reset_crashkernel yes
> path /var/crash
> core_collector makedumpfile -l --message-level 7 -d 31
> #core_collector scp
> #kdump_post /var/crash/scripts/kdump-post.sh
> #kdump_pre /var/crash/scripts/kdump-pre.sh
> #extra_bins /usr/bin/lftp
> #extra_modules gfs2
> #failure_action shell
> #force_rebuild 1
> #force_no_rebuild 1
> #dracut_args --omit-drivers "cfg80211 snd" --add-drivers "ext2 ext3"
> #fence_kdump_args -p 7410 -f auto -c 0 -i 10
> #fence_kdump_nodes node1 node2
>
>
>
> Regards,
>
> Venkat.
>


