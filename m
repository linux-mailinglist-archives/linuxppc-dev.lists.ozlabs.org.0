Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C906970C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 23:30:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGbWr5Yxxz3cfH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 09:30:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=YLvFKW+E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=YLvFKW+E;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGS8h1VFGz3bwQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 03:58:42 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31EGXk5t027870;
	Tue, 14 Feb 2023 16:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=COxPmLf+paRDDdFuvH25Zi2bcrkGUWbmw1AV1Vzz6fg=;
 b=YLvFKW+EqHo4lJihtKam5O2u/Ez9btXYR9UATFH2zB8Iu5e5Y/RW6Fp0KY6CkhCradAN
 WTilqdKWZFcLKiqsqfa4V8mYN1ZQvBadLk2TsOnIkEtZUKsfbgOWWK7HvSPFJKd8W46X
 6I8lZN4dOtwp7sy+z6JM8Hyy2wb+bAGvhr+gIyRw8kVIAEWVmTfaTTf5O0Ec6XCJ2W+/
 s+ECjqJ+6XkIgXtXUIiTIJDq/ia5qoW1iTGafvouFXOp0XKQKEIPCwqm6SXEU/hwPFGd
 rIIwhMwB2pOtB0Be/uO7OEApgaB8P0mSiaWnOpESEKGFyDpTBPCUpGUYLIbIrtBSw8Fd aQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2mtdxts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Feb 2023 16:57:48 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31EGuKPb009707;
	Tue, 14 Feb 2023 16:57:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3np1f5uuka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Feb 2023 16:57:47 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EGuHor039739;
	Tue, 14 Feb 2023 16:57:45 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3np1f5uuff-9;
	Tue, 14 Feb 2023 16:57:45 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: (subset) [PATCH 00/35] Documentation: correct lots of spelling errors (series 1)
Date: Tue, 14 Feb 2023 11:57:35 -0500
Message-Id: <167639371105.486235.1228754650636546815.b4-ty@oracle.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127064005.1558-1-rdunlap@infradead.org>
References: <20230127064005.1558-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_11,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=997 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140144
X-Proofpoint-GUID: F9bpdPmEiXIR5xn5JduF_4kuCVCc4so3
X-Proofpoint-ORIG-GUID: F9bpdPmEiXIR5xn5JduF_4kuCVCc4so3
X-Mailman-Approved-At: Wed, 15 Feb 2023 09:30:03 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Juri Lelli <juri.lelli@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Pavel Machek <pavel@ucw.cz>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Evgeniy Polyakov <zbr@ioremap.net>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincent Guittot <vincent.guittot@linaro.org>, James Morris <jmorris@namei.org>, linux-acpi@vger.kernel.org, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-sgx@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-spi@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, alsa-devel@alsa-project.org, linux-doc@vger.kernel.org, Max Filipp
 ov <jcmvbkbc@gmail.com>, keyrings@vger.kernel.org, linux-i2c@vger.kernel.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-trace-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Daniel Jordan <daniel.m.jordan@oracle.com>, linux-crypto@vger.kernel.org, linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, Wolfram Sang <wsa@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, isdn4linux@listserv.isdn4linux.de, linux-input
 @vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>, Fenghua Yu <fenghua.yu@intel.com>, Jiri Kosina <jikos@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-fbdev@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, target-devel@vger.kernel.org, bpf@vger.kernel.org, Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>, linux-mm@kvack.org, linux-trace-devel@vger.kernel.org, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, linux-leds@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, linux-scsi@vger.kernel.org, Marc Zyngier <maz@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Jonas Bonn <jonas@
 southpole.se>, Heiko Carstens <hca@linux.ibm.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-block@vger.kernel.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, openrisc@lists.librecores.org, Josh Poimboeuf <jpoimboe@kernel.org>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-security-module@vger.kernel.org, Daniel Bristot de Oliveira <bristot@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Jan 2023 22:39:30 -0800, Randy Dunlap wrote:

> Correct many spelling errors in Documentation/ as reported by codespell.
> 
> Maintainers of specific kernel subsystems are only Cc-ed on their
> respective patches, not the entire series. [if all goes well]
> 
> These patches are based on linux-next-20230125.
> 
> [...]

Applied to 6.3/scsi-queue, thanks!

[28/35] Documentation: target: correct spelling
        https://git.kernel.org/mkp/scsi/c/c57ac5748be5

-- 
Martin K. Petersen	Oracle Linux Engineering
