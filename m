Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A8DA377
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 04:02:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tsqm2GC9zDr8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 13:02:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=msn.com
 (client-ip=2a01:111:f400:febe::807;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=adamliyi@msn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=msn.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=msn.com header.i=@msn.com header.b="EMTlL60N"; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01olkn0807.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::807])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tsnl5BY7zDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 13:00:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RE0m1yDl/NMRifcabQfmp5qc9kzoPQBTZ6TS5G/uFxm9m8bTxOmRQo4uFUKN0Pl+7YpqMdrcN/U+dv3u5Q8JboZMgQbe1i7Qs/81+qKGW56Cjv+3QVecv7VKRFZfnAMgaJHntNVM6thtyxMpCmH5eT14c71s2c51Em+cCVD/rAFgINmZhoEIoy1kjajCd6Am0BUrlKvLcCSgO9jZBQQsn4y/cgit+jGww4NwBPKozTpT1soHAZPVmT3WKx6/ZsYXHNnjTRTQXnhOUmoF8mha2SndGQyKPue4JPJkLvfvgjri6mFThngdEiB5fWdsMzw8ZSNG7vn2uVrdBmzfH/ZD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFX25hPksm/Bs/sMw2TFK8cKyTP+LSt32wfuwjDqhmk=;
 b=ahKVXSp3a80eqYOArgSRdmZeGLgn5s+2Y7pTrHSj9H1bVUwF2W5+QkN13ZifezMeWcHOcxcihG1RmP8MzHccJXat43yKEsraCrk+ni6lIdCLX3FIrHdhwasr+Vi33poPxg2VgelTNFYICaB8uqrhDrMNdsA4tcKu0SxKm7FaS5vxlXmbhb3wiwZNQDeeyDVR/iN9vE2TmVoILWpAlND7zY+Byj2w4r7RgHVR2AUVC5ZBRQPgUx9HjSG5bFI5xzqcXQZKA1vuqVPVPJpW/HohrME6M05/8haJxmtenpbZPffgsgofuXlyyyamPwvJFD7a7ffGYnVLUc85fIB3GntXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=msn.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFX25hPksm/Bs/sMw2TFK8cKyTP+LSt32wfuwjDqhmk=;
 b=EMTlL60Nejn5KLEkRNqohMWNbVNKoTI3wMjpQOA8hY3XUbKKlxdGKTQL9sBf+fw+SlIwf9ho18wiWAvrL+cG2EQjY8alFP36E6U5pna5eBdoMcBbdzQROyMr0jqXMBzqPr6lnh8qhh2xJ1rZ+qRFsWIhJg0DxD2U/Dsh6PSW/MrULcDbWXNztolI5genZdJ4/gkJUmySDiNhagjCZRL2pAMxWu7OdDARMtpwpvBEcVFhPn1jgCrKBDQaDBpPh4Ddvuj7gnL91l3MCNQMK6lo3SlVcAqPRdq3q5UJpNWtX966Zvs9ylZPVGrCTHageN+da91tOj3Q+RZcdgRI4BIjUw==
Received: from HK2APC01FT029.eop-APC01.prod.protection.outlook.com
 (10.152.248.56) by HK2APC01HT119.eop-APC01.prod.protection.outlook.com
 (10.152.249.130) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.14; Thu, 17 Oct
 2019 02:00:38 +0000
Received: from HK0PR02MB3283.apcprd02.prod.outlook.com (10.152.248.57) by
 HK2APC01FT029.mail.protection.outlook.com (10.152.248.195) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 02:00:38 +0000
Received: from HK0PR02MB3283.apcprd02.prod.outlook.com
 ([fe80::31c7:818c:74cc:d7c0]) by HK0PR02MB3283.apcprd02.prod.outlook.com
 ([fe80::31c7:818c:74cc:d7c0%6]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 02:00:38 +0000
From: Yi Li <adamliyi@msn.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: system call hook triggers kernel panic
Thread-Topic: system call hook triggers kernel panic
Thread-Index: AQHVhI0S2xqYBin3+EmsoDD9WJ6P8w==
Date: Thu, 17 Oct 2019 02:00:38 +0000
Message-ID: <HK0PR02MB3283E73F2AA72D7EFA4350A3D96D0@HK0PR02MB3283.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:06E261758EC6EBC15D59CC26704AD3391F1244ED69DAB8A1D2AFE3C87F823850;
 UpperCasedChecksum:398E4DCC12819AAF7C0E849FEF73581DADA1BC35AFF8048480CF569034A61785;
 SizeAsReceived:6621; Count:41
x-tmn: [aDj+kmyDOOxCNndiU1XOXDlgz5yk7/Br]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: HK2APC01HT119:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bBsWCWLSjT4XAsU2V+4xjsFmWsTVrTQXKTMl1tuBph5GBggNyKESo68LfxBLgdAJBqOUlJVpb/TXIA4V6BZC4oFZjBunKlOQeVoJeAZjUH9q9UI87kv/4FduIHCSX955iW3ebFzUDk0lACwO4aDkN0kCbGCrAQQg4OE79D7JPKExNeyMyvHE04E3lmCSxYp/
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 724bcdd6-f3da-4733-daaf-08d752a5ce66
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 02:00:38.0980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT119
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,=0A=
=0A=
We tried to replace the umount system call with our own code. Bellow is the=
 simplified test case.=0A=
When doing umount, there is kernel panic (on centos7 4.14.0-115.10.1.el7a.p=
pc64le kernel) on P9 OpenPOWER machine.=0A=
Could you please give suggestions on how to make the system call hook work =
properly on powerpc?=0A=
=0A=
"=0A=
#include <linux/module.h>=0A=
#include <linux/slab.h>=0A=
#include <linux/kallsyms.h>=0A=
=0A=
static void** sct;=0A=
=0A=
static asmlinkage long (*orig_umount)(char __user *, int);=0A=
=0A=
static asmlinkage long umount_hook(char __user *name, int flags)=0A=
{=0A=
	char *dir_name;=0A=
	long ret;=0A=
=0A=
	dir_name =3D strndup_user(name, 512); =0A=
	printk(KERN_NOTICE "umount %s 0x%x\n", dir_name, flags);=0A=
	kfree(dir_name);=0A=
=0A=
	ret =3D orig_umount(name, flags);=0A=
=0A=
	printk("umount2 returned %ld\n", ret);=0A=
=0A=
	return ret;=0A=
}=0A=
=0A=
static int __init poc_init(void)=0A=
{=0A=
	sct =3D (void**)kallsyms_lookup_name("sys_call_table");=0A=
=0A=
#ifdef CONFIG_PPC64=0A=
	orig_umount =3D sct[__NR_umount2 * 2];=0A=
	sct[__NR_umount2 * 2] =3D umount_hook;=0A=
#else=0A=
	/*=0A=
	 * For recent kernel on x86, we would need remove memory protection=0A=
	 * before modify syscall table, let's ignore the work for a PoC.=0A=
	 *=0A=
	 * The stock kernel for CentOS 7.4 or lower should be just fine.=0A=
	 */=0A=
	orig_umount =3D sct[__NR_umount2];=0A=
	sct[__NR_umount2] =3D umount_hook;=0A=
#endif=0A=
=0A=
	printk("syscall.__NR_umount2 replaced\n");=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
static void poc_exit(void)=0A=
{=0A=
#ifdef CONFIG_PPC64=0A=
	sct[__NR_umount2 * 2] =3D orig_umount;=0A=
#else=0A=
	sct[__NR_umount2] =3D orig_umount;=0A=
#endif=0A=
=0A=
	printk("syscall.__NR_umount2 restored\n");=0A=
}=0A=
=0A=
module_init(poc_init);=0A=
module_exit(poc_exit);=0A=
=0A=
MODULE_DESCRIPTION("syscall hook poc.  load it, umount something, then dmes=
g to"=0A=
	" check its activities.");=0A=
MODULE_VERSION("1.0");=0A=
MODULE_LICENSE("GPL v2");=0A=
MODULE_AUTHOR("Huang Le");=0A=
"=0A=
=0A=
The kernel module can be insert correctly, and we mount a tmpfs, then umoun=
t.=0A=
Kernel panic when doing umount:=0A=
"=0A=
[  148.569777] umount /home/adam/test 0x0=0A=
[  148.608227] umount2 returned 0=0A=
[  148.608268] Unable to handle kernel paging request for data at address 0=
xc00800001625a288=0A=
[  148.608320] Faulting instruction address: 0xc00000000001d610=0A=
[  148.608387] Oops: Kernel access of bad area, sig: 11 [#1]=0A=
[  148.608418] LE SMP NR_CPUS=3D2048 NUMA PowerNV=0A=
[  148.608460] Modules linked in: poc(OE) rpcrdma sunrpc ib_isert iscsi_tar=
get_mod ib_iser libiscsi scsi_transport_iscsi ib_srpt target_core_mod ib_sr=
p scsi_transport_srp ib_ipoib rdma_ucm ib_ucm ib_uverbs ib_umad rdma_cm ib_=
cm iw_cm ib_core i2c_dev ses ipmi_powernv enclosure scsi_transport_sas sg i=
pmi_devintf at24 ofpart powernv_flash ipmi_msghandler mtd shpchp uio_pdrv_g=
enirq opal_prd ibmpowernv uio ip_tables ext4 mbcache jbd2 sd_mod ast i2c_al=
go_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm drm=
 tg3 megaraid_sas be2net aacraid ptp pps_core=0A=
[  148.608946] CPU: 5 PID: 15540 Comm: umount Tainted: G           OE  ----=
--------   4.14.0-115.10.1.el7a.ppc64le #1=0A=
[  148.609075] task: c000003fc4017000 task.stack: c000003fbae9c000=0A=
[  148.609159] NIP:  c00000000001d610 LR: c00000000000dd00 CTR: 00000000000=
0004e=0A=
[  148.609239] REGS: c000003fbae9fb70 TRAP: 0300   Tainted: G           OE =
 ------------    (4.14.0-115.10.1.el7a.ppc64le)=0A=
[  148.609339] MSR:  9000000002803033 <SF,HV,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR=
: 22000844  XER: 20040000=0A=
[  148.609391] CFAR: c00000000001d5f8 DAR: c00800001625a288 DSISR: 40000000=
 SOFTE: 1=0A=
[  148.609391] GPR00: c00000000000dd00 c000003fbae9fdf0 c0080000161c8400 c0=
00003fbae9fea0=0A=
[  148.609391] GPR04: 0000000000040080 0000000000000000 0000000000000001 00=
00000000000000=0A=
[  148.609391] GPR08: c008000016258400 0000000000000002 0000000000000002 00=
00000000000c00=0A=
[  148.609391] GPR12: 0000000000000000 c00000000fa83700 0000000000000000 00=
00000000000000=0A=
[  148.609391] GPR16: 0000000000000000 0000000000000000 0000000000000000 00=
007fffe86f3234=0A=
[  148.609391] GPR20: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000=0A=
[  148.609391] GPR24: 000000012a7d6468 000000012a7d6590 0000000000000001 00=
00000163a574f0=0A=
[  148.609391] GPR28: 00002000000e1d54 0000000000000000 c000003fbae9fea0 90=
0000000280f033=0A=
[  148.610016] NIP [c00000000001d610] restore_math+0x60/0x200=0A=
[  148.610079] LR [c00000000000dd00] ret_from_except_lite+0x2c/0x74=0A=
[  148.610143] Call Trace:=0A=
[  148.610186] [c000003fbae9fdf0] [c000003fbae9fe30] 0xc000003fbae9fe30 (un=
reliable)=0A=
[  148.610287] [c000003fbae9fe30] [c00000000000dd00] ret_from_except_lite+0=
x2c/0x74=0A=
[  148.610378] Instruction dump:=0A=
[  148.610414] 7be7e8a4 78e71f87 40820024 e92d0260 89290e78 2f890000 409e00=
14 e92d0260=0A=
[  148.610471] 89290e79 2f890000 419e0074 3d020009 <e9081e88> 7d4000a6 7d49=
4378 60000000=0A=
[  148.610568] ---[ end trace 1ec6b39ae7531745 ]---=0A=
[  149.593561]=0A=
[  150.593628] Kernel panic - not syncing: Fatal exception=0A=
"=0A=
=0A=
Thanks,=0A=
-Yi Li=0A=
