Return-Path: <linuxppc-dev+bounces-9851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3C6AEBCA2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jun 2025 17:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTKtY4Mw6z2ySY;
	Sat, 28 Jun 2025 01:56:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751039813;
	cv=none; b=XQz0IRaBi1Q163t0UM5cKmQaNf2/PJgUz0mR8do7SuIEp63j/wjUy7Ti/ooV+GiWIY+7izl+aYQ/ywBdfFf7I2s2PFqrJt6xcMGROXf8sGFbEIqDKz3QaH07OEeWnlNU78tLBrEhDeHBE2zYiYCkwJ7XpdexnQ3C2Q1rh420OjFMjJ+8RnE7cSFDFuGkfbBw9lqZFXJ3GHgTIla/FtXpHr8kvW78yFuidYYQRQkuKc7hnXcjhG6WT/K6jCLAJEZhaaRIhGnpsOUU2iQB47y+fiFk9VfczzTw7hsGwxoGPXpp6WtwroAcz/p4uPb9jmWu9ohP0Vo1EpW7ZP7/1tLmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751039813; c=relaxed/relaxed;
	bh=IOusWH85S4yiTdywO3XqYqSK8cw+vKq9Jp+ntdI2tpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCPBXdddxRjSCVAMOXOejbCbXGPEGNeSrt6k6CwBBK8aV2T4M8jfVoUA1czAgh4nxzEUrkAa+/ri0/uMz9cwPwE8Xd5a0kMmzeOWGuYL8eR3NaWS2gx6FDH56SXqPRcebxKoMmt4CzS1zIMUifJkdioZpCSBX9LTJ3gI/0L+6oYU6bYrygdIV0TU02fJlO5IbEkCI719yu8osv66TKJ7zoCbZEVwzD/6p3rXn3HQcxyg7i6mnF0H5jOFPLWi03hVw2V8hJqw5fUOnd8C0ThySjagW0bLWDJ/OhHrec25S5hKRk8cluuuFz7gYiSCJARJLfVjxte1MYO8h37JRwDytg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bWUy2+KH; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bWUy2+KH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTKtX0l0Yz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 01:56:51 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R8HC56010490;
	Fri, 27 Jun 2025 15:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=IOusWH85S4yiTdywO3XqYqSK8cw+vK
	q9Jp+ntdI2tpE=; b=bWUy2+KHyNK2AImHPoT/K7nzfyjM9NmbuPvmXplHr+g7Y1
	XypofmRRr63tOsATvlz60+Wh/jAkHbBDW1m06Xp4w2EWccwM0RJ8z8f/KoYWJeOg
	7/fYOrpDpOX/qcMMSetF5V0Yi78zQj8arGJTbiEmJrArgZI7GA1orxcm1ivZa2CO
	9fjaBYSiqaW49sfvXKOO5C6Vu7EeMAP6cSsfUCix4Ifi792kapFAfhH9xCBZ7UNx
	cni79E0bRZxeweolBPXZyKdVQdzJZeeSVMuK1+fX7xGK4fq9qDKhajNSSl7x8Do+
	1dO+VnToeXsnT3eToBYuSmsdNn/I5R3qzZDDED2A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47gsphva72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:56:27 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55RFtCtW014897;
	Fri, 27 Jun 2025 15:56:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47gsphva6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:56:26 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC14MI014987;
	Fri, 27 Jun 2025 15:56:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e72u52rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:56:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55RFuLZq17498492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 15:56:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 869D720043;
	Fri, 27 Jun 2025 15:56:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E42A20040;
	Fri, 27 Jun 2025 15:56:20 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.0.221])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Jun 2025 15:56:20 +0000 (GMT)
Date: Fri, 27 Jun 2025 17:56:18 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, "Lee, Chun-Yi" <jlee@suse.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, Lu Jialin <lujialin4@huawei.com>
Subject: Re: [PATCH RESEND] integrity: Extract secure boot enquiry function
 out of IMA
Message-ID: <aF6/ItTfd7oVN+Sn@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250626023617.3885806-1-gongruiqi1@huawei.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626023617.3885806-1-gongruiqi1@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZVGn4lXE8Yi5L_H_NMtRZszsX8O1zlVQ
X-Proofpoint-ORIG-GUID: cRmhbyTPAwHuG266gZfp9uPvG-4fDGhs
X-Authority-Analysis: v=2.4 cv=Hul2G1TS c=1 sm=1 tr=0 ts=685ebf2b cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=MfmPClk6on00Wl0lz3oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOCBTYWx0ZWRfX6FVFnTWLiZx0 z+RdbizKGA2mloifLyiTyqfs1kKkb6HuDB7ShsfyeOqkPjTZQ2RFoKFT6dgyhrDmqMjux7VWIhh 1sclUvGeNFDf8T/69PdD+yAWPwgTzIPkpYSQDQOOlTU+Q3kohFm9WF7bQSgMvdjoASGwEtnXvcY
 6y+ex2clQaDlEgQmJ06Fff03IWLZROr7C1eXc6Df7d/Z+tqVlulcx8L546Q1zKdlECtopleiyQ2 QhKyVwbYOwhggvmbHlMyekUCKU7JpeaDVC4OBgVMcngHb2SiwhL/a1PfRc+8dEBCYVnzzvPidyN iJlbRUHMzNB2FsUG296X4cX4R6GG8CqcCKCaJA3nmlNYVy7ram2mcjJ09GJWSOVzIvDWMmgtY2B
 mAjNLCSr8qBAq/aNrZEhsp1J54ZLASLtkHcj3YTHS5pQmacwx9wmLyhvEpCo0XcQkn+m54j9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=952 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270128
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 10:36:17AM +0800, GONG Ruiqi wrote:

Hi GONG,

...
> Compile-tested for powerpc, s390 and x86, all with allmodconfig.

This breaks defconfig and debug_defconfig builds on s390
since IMA_ARCH_POLICY=n in these configurations and thus
CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=n as well:

s390x-15.1.0-ld: security/integrity/ima/ima_main.o: in function `ima_load_data':
/home/agordeev/linux.c3/security/integrity/ima/ima_main.c:902:(.text+0x54e): undefined reference to `arch_integrity_get_secureboot'
s390x-15.1.0-ld: security/integrity/ima/ima_appraise.o: in function `ima_appraise_parse_cmdline':
/home/agordeev/linux.c3/security/integrity/ima/ima_appraise.c:30:(.init.text+0x44): undefined reference to `arch_integrity_get_secureboot'
make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux.unstripped] Error 1
make[1]: *** [/home/agordeev/linux.c3/Makefile:1236: vmlinux] Error 2
make: *** [Makefile:248: __sub-make] Error 2

> Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>

Thanks!

