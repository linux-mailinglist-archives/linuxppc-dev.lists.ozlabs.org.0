Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031D84ADF9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 06:21:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=b+KMj6tv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTWmp1QTxz3cLV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 16:20:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=b+KMj6tv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 7516 seconds by postgrey-1.37 at boromir; Tue, 06 Feb 2024 15:14:05 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTVHd6nS5z2yps
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 15:14:04 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4161Ewsc023386;
	Tue, 6 Feb 2024 02:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=TNBqmrMN0GKiz0meyol2MTt7jK7ZOMX41ADnOQ7L/UU=;
 b=b+KMj6tvO4efzEbKZhSG/xzlHnsPmbgMlBfcTWawkZTnAIffaQla4J5cVDofspUuJqWS
 /o00HHnk0n3gN9qp3mx/3E4gJC1I52m2sdoqn6JFMG+i8UwxEXr0NcQnIWxdhEFBJn+E
 /x8af1pQLtk1k1AM1L7u822p8aQ15VNJPSq8MPE9D4515Gx5HixPyTgAvA3/EgoqxoHI
 QgW4sF8UUf5WKq6QgWwluTQ92vNZ9x/szjLyibVmDwZBAu8ox17jHGO02Dm+ih1uUcH6
 DGK4SsClE47m3SK3AzW4xYXw6GyPWvrQpLAswBi0lOq+tWmzWKU14KToHTtMKtqix0Tu 5w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1dhddkp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 02:08:03 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4161MK9a039504;
	Tue, 6 Feb 2024 02:08:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx6cdtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 02:08:02 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41627qHJ034652;
	Tue, 6 Feb 2024 02:08:01 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3w1bx6cdrb-2;
	Tue, 06 Feb 2024 02:08:01 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-kernel@vger.kernel.org, Li Zhijian <lizhijian@fujitsu.com>
Subject: Re: (subset) [PATCH 00/42] Fix coccicheck warnings
Date: Mon,  5 Feb 2024 21:07:38 -0500
Message-ID: <170715263710.945763.16540743989774199712.b4-ty@oracle.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20240116041129.3937800-1-lizhijian@fujitsu.com>
References: <20240116041129.3937800-1-lizhijian@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_18,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=980 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402060013
X-Proofpoint-GUID: fwziPvoQs2DBL9rAMuJ3Du7KSNls4Hgl
X-Proofpoint-ORIG-GUID: fwziPvoQs2DBL9rAMuJ3Du7KSNls4Hgl
X-Mailman-Approved-At: Tue, 06 Feb 2024 16:20:20 +1100
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
Cc: Eddie James <eajames@linux.ibm.com>, dri-devel@lists.freedesktop.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Christian Gromm <christian.gromm@microchip.com>, Sathya Prakash <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, linux-iio@vger.kernel.org, Chandrakanth patil <chandrakanth.patil@broadcom.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>, Stefan Achatz <erazor_de@users.sourceforge.net>, megaraidlinux.pdl@broadcom.com, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com, Jiri Olsa <jolsa@kernel.org>, Don Brace <don.brace@microchip.com>, Mark Rutland <mark.rutland@arm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, linux-fbdev@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartne
 rship.com>, target-devel@vger.kernel.org, Helge Deller <deller@gmx.de>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Satish Kharat <satishkh@cisco.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, James Morse <james.morse@arm.com>, Jonathan Cameron <jic23@kernel.org>, Hannes Reinecke <hare@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, platform-driver-x86@vger.kernel.org, Michal Januszewski <spock@gentoo.org>, Nilesh Javali <njavali@marvell.com>, =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>, Karan Tilak Kumar <kartilak@cisco.com>, Joel Stanley <joel@jms.id.au>, linux-input@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, MPT-FusionLinux.pdl@broadcom.com, linux-fsi@
 lists.ozlabs.org, Robert Richter <rric@kernel.org>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>, Borislav Petkov <bp@alien8.de>, storagedev@microchip.com, Mauro Carvalho Chehab <mchehab@kernel.org>, HighPoint Linux Team <linux@highpoint-tech.com>, cocci@inria.fr, "Martin K . Petersen" <martin.petersen@oracle.com>, Sesidhar Baddela <sebaddel@cisco.com>, Julia Lawall <Julia.Lawall@inria.fr>, Sumit Saxena <sumit.saxena@broadcom.com>, Jeremy Kerr <jk@ozlabs.org>, Manish Rangankar <mrangankar@marvell.com>, Ian Rogers <irogers@google.com>, Stuart Yoder <stuyoder@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Artur Paszkiewicz <artur.paszkiewicz@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ketan Mukadam <ketan.mukadam@broadcom.com>, linux-scsi@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Michael Cyr <mikecyr@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Alistar
  Popple <alistair@popple.id.au>, Richard Cochran <richardcochran@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, Hans de Goede <hdegoede@redhat.com>, Hannes Reinecke <hare@suse.de>, Namhyung Kim <namhyung@kernel.org>, linux-edac@vger.kernel.org, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, netdev@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jan 2024 12:10:47 +0800, Li Zhijian wrote:

> make coccicheck COCCI=$PWD/scripts/coccinelle/api/device_attr_show.cocci`
> complians some warnnings as following[1]:
> 
> Not sure if someone had tried these fixes, feel free to ignore this
> patch set if we have come to a *NOT-FIX* conclusion before :)
> 
> This patch set also fix a few snprintf() beside coccicheck reported.
> For example, some thing like
> xxx_show() {
> 	rc = snprintf();
> ...
> 	return rc;
> }
> 
> [...]

Applied to 6.9/scsi-queue, thanks!

[22/42] drivers/scsi/fnic: Convert snprintf to sysfs_emit
        https://git.kernel.org/mkp/scsi/c/1ad717c92925
[25/42] drivers/scsi/ibmvscsi: Convert snprintf to sysfs_emit
        https://git.kernel.org/mkp/scsi/c/29ff822f466e
[26/42] drivers/scsi/ibmvscsi_tgt: Convert snprintf to sysfs_emit
        https://git.kernel.org/mkp/scsi/c/01105c23de42
[27/42] drivers/scsi/isci: Convert snprintf to sysfs_emit
        https://git.kernel.org/mkp/scsi/c/5fbf37e53091
[34/42] drivers/scsi/pm8001: Convert snprintf to sysfs_emit
        https://git.kernel.org/mkp/scsi/c/8179041f801d

-- 
Martin K. Petersen	Oracle Linux Engineering
