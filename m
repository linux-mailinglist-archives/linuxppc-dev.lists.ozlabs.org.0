Return-Path: <linuxppc-dev+bounces-5015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC87A09CFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 22:18:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVDyd2W2sz30hQ;
	Sat, 11 Jan 2025 08:18:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.165.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736543881;
	cv=none; b=EKnrIWs7axf8j30k7ZMc0YVoEFROlk0i/SsYa1jFcP7eu0OX6ICthwzbSsu5sDJma8Bn1nwaAvGrNU/z3lXi+5IftfLLPmW0G/4l8Rq1mIRCQLQyB0AwnHUQmRinLtwOMD8SlPr983t0xjTdnlj3XpDUPMC6/Ga2MUuyWsbPN84V0N1e0Z2w3ljKb1mG0kBThxHHrAyud+RlnGNOzcU3ruaePMd43T04PqNiWkS76eUAqCj43FyESwR3JHtvSraokMAenfLtHatwgMpLI/wMsxaXt2nOqChLo+epV6Xi8XtuI1DSRg7nEdR/NyC8tfjt/BazSpK5OPDNPVTEqKIXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736543881; c=relaxed/relaxed;
	bh=ZBlzpPGWwX1EqrUgduX1gp9gwKpMyq3jf4Gs//IDYhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OyXKF+9DmlG/9NdRFktTThjpb2M6W1Lp1wpain/XghWmpH7Z4VicrXkUtruEAb8/PhZQvSr0fWBU+86VHmecDLorCiz4GkyC0FeFTCQiUtT57ciOY0eE/0U/hHzq/APgakrvVT6V4ENOi5RV9Sj4InIWaArmIT2qhW12RqLxTLysf++NiyNP2l5HJ5v7nKZYVoW5LZoxGzrpFDlVVwevb/aQsHpxLeSS7977Ctn1tQoJPuRYiaIRg3rbUx6TQ9LG6S/jAyYKW5HrHpoDy24CPDQG5q09H0pAwsDl69XhbLIuqlNEUUHaryJGZ1uCJw8E663hPhzY3Glj0dZzjYYjxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=Xvoz0sBr; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=Xvoz0sBr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVDyb6vf9z30g1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 08:17:58 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ALDVbO031479;
	Fri, 10 Jan 2025 21:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZBlzpPGWwX1EqrUgduX1gp9gwKpMyq3jf4Gs//IDYhY=; b=
	Xvoz0sBrTtTa0eQ4g7WLILhWzcCkrDup3kFcNoEgyuEoZZfmlNV72Blm0ANsdH0b
	+3BuseKJjrIUxncBx/fCQEg6hBkkaMD5NPnLd2XF7FNF80JjrV2TjbPnUBdDOUOo
	CAefg+O9+29bIvrsigOBs8niWpoAAK7DxJZqdkWds/HJU9aMPxUuuT3AQBUsnk0k
	nJjva5SnbsMwJjcCLjb2qH/ahlQAPeaSvGILr6aPh3oVNEN6t/3PqUdW7QVP1i8j
	fcSPJGGpvjIePezv1eRL0gtK2ZfcBfUnNhX3wu5OSot6bbpysII98oj+vty3umMo
	aFyL6FWeMXDzrtY9rTk+mw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xuk0c39f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 21:17:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50AJbHdJ027327;
	Fri, 10 Jan 2025 21:17:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xued5r8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 21:17:38 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50ALHQ26034137;
	Fri, 10 Jan 2025 21:17:38 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 43xued5r3k-9;
	Fri, 10 Jan 2025 21:17:37 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Adam Radford <aradford@gmail.com>,
        Bradley Grove <linuxdrivers@attotech.com>,
        Tyrel Datwyler <tyreld@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        James Smart <james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        Brian King <brking@us.ibm.com>, Saurav Kashyap <skashyap@marvell.com>,
        Javed Hasan <jhasan@marvell.com>,
        GR-QLogic-Storage-Upstream@marvell.com,
        Nilesh Javali <njavali@marvell.com>,
        Manish Rangankar <mrangankar@marvell.com>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/11] scsi: Constify 'struct bin_attribute'
Date: Fri, 10 Jan 2025 16:16:51 -0500
Message-ID: <173654330200.638636.14316160501639479876.b4-ty@oracle.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241216-sysfs-const-bin_attr-scsi-v1-0-f0a5e54b3437@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-scsi-v1-0-f0a5e54b3437@weissschuh.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_09,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=871 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501100164
X-Proofpoint-ORIG-GUID: Ia0G0LwR1gpmpADi0HH4eI5RcWSdT8JS
X-Proofpoint-GUID: Ia0G0LwR1gpmpADi0HH4eI5RcWSdT8JS
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 16 Dec 2024 12:29:07 +0100, Thomas Weißschuh wrote:

> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
> 
> 

Applied to 6.14/scsi-queue, thanks!

[01/11] scsi: core: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/e4dab5d1ded3
[02/11] scsi: 3w-sas: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/1cf448bd2e6a
[03/11] scsi: arcmsr: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/3e72fc051d4c
[04/11] scsi: esas2r: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/61e2d41cafc6
[05/11] scsi: ibmvfc: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/af58c759836b
[06/11] scsi: lpfc: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/4594a1f827d4
[07/11] scsi: ipr: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/f6af41ff6671
[08/11] scsi: qedf: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/a8116aa2898b
[09/11] scsi: qedi: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/f9d0a8450ee3
[10/11] scsi: qla2xxx: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/06a9ceb95f86
[11/11] scsi: qla4xxx: Constify 'struct bin_attribute'
        https://git.kernel.org/mkp/scsi/c/ea4f2219dd40

-- 
Martin K. Petersen	Oracle Linux Engineering

