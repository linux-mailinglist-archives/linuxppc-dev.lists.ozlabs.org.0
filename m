Return-Path: <linuxppc-dev+bounces-4472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 914809FC38A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2024 05:34:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YHzRl15Gnz2yFD;
	Wed, 25 Dec 2024 15:34:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735101251;
	cv=none; b=VM9+8eKNrhEL3jIy0YfYHVPYaRjvBWsYVXCGOeDxus9bIR66sorc3lDj6ds0K/484FCFlG0GqmtLBUSOD8NIGOp+1WfecrzsfHPvH3jTGh2uQhFNhR2q5ucj/8m9KvZrkwOZ4MD969Qh0XGGBRz6drU25o8ZI9ozioX0Kxuh8ZuIb7AqrOGwyIiRvJO1UTWyhD8FWPkz/w9+wYOiaSD8xH4hKkpngj3D003vFYOiQBQXekVkPB0rBo9V2RuaXZ7dTONRXsUOjUSfyLzL6ZAXlBtKeEkoV0pg6HfQRulogXMcuWNrQgxnG1WHfnsPLv8LCWM4a5B731mw0fazIho4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735101251; c=relaxed/relaxed;
	bh=ya7ZamQzWS2KOZI+zsJzBatlyjC0CxPZdQKzTQa5G94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIwwIpGOpnmyWyGEvzngmEMk0YHhmbBuo2hSLpyLiPFzvQjJ3TY1LFKp0TD/s5oDKZeIZVBTirbsPQ6KAnlUHQwjvU+MG5Xi3qrKuE4ffW+FnWU8Fbdjbu4vLO/rILZp3KhEDMmakNKCYJpzl+G8P/YBwaF48MVOcqN0cirB7q8sQ5U43GJ8xkSQnFgjI6W9wV3IT7zlu7iYAkkGgDvWScshe+9+aH2SOFW2trjEDOsYTqLrWdrrHTvDWBHuTd9XbRy63sEyFf6saaPNdRG5BqNHzY9oARZ13A7t7RjtI25id0ALlaacx1LDsOKld1JjRQ9R3YyAyT6vALvfoiP9Ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mijq7tXB; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mijq7tXB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YHzRj5WqXz2xy6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2024 15:34:09 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP3qohN006681;
	Wed, 25 Dec 2024 04:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ya7Zam
	QzWS2KOZI+zsJzBatlyjC0CxPZdQKzTQa5G94=; b=Mijq7tXBebBqt6e7uPhNTu
	2GKel5LzrqR2UrfErOesbfC6bM7/GssGJLyc3Qwez5Hc844xstQtDGQt5aAM0Gmv
	vZ8eAmLRI1cUUtMaa96aK8KpNNNJgskxVWMFpbDi312IRiw0kKbIGAbMM+UKE+r2
	fFaK/nS2GBjFtRrvHbRklgBZY2KjkG3bMiXwUtxYTFHx3SsvlN2MmYEMEC26PcWX
	DInGNcTBtYOCUYdtWlnoga4bXtXwTprQbZryO1MMIY+50tTE1ZxijEsLPSK3jfD6
	f7Evk1BAmvouuoVAzr3xG7yBVWELmegY4FwLYn1BqOfaCxcgIcohyOGqZvnToKtA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43rahk03tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 04:33:58 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BP4Xwci030167;
	Wed, 25 Dec 2024 04:33:58 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43rahk03tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 04:33:58 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP1DUAq020569;
	Wed, 25 Dec 2024 04:33:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43p8cycwst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 04:33:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BP4XtCh52494792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Dec 2024 04:33:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 300DF20043;
	Wed, 25 Dec 2024 04:33:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 389F020040;
	Wed, 25 Dec 2024 04:33:52 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.66.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Dec 2024 04:33:51 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, hbabu@us.ibm.com
Subject: Re: [PATCH] powerpc/pseries/vas: Add close() callback in vas_vm_ops struct
Date: Wed, 25 Dec 2024 10:03:46 +0530
Message-ID: <173510109647.1031723.12074222522167922593.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241214051758.997759-1-haren@linux.ibm.com>
References: <20241214051758.997759-1-haren@linux.ibm.com>
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
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fV409cWVg1zSbs9sQ2sXMIq-MiZEeRT3
X-Proofpoint-ORIG-GUID: ecCbRFFm1nNhGYXcwQW9r3NeXIlhl7SY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=661 suspectscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250037
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 13 Dec 2024 21:17:58 -0800, Haren Myneni wrote:
> The mapping VMA address is saved in VAS window struct when the
> paste address is mapped. This VMA address is used during migration
> to unmap the paste address if the window is active. The paste
> address mapping will be removed when the window is closed or with
> the munmap(). But the VMA address in the VAS window is not updated
> with munmap() which is causing invalid access during migration.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/vas: Add close() callback in vas_vm_ops struct
      https://git.kernel.org/powerpc/c/05aa156e156ef3168e7ab8a68721945196495c17

Thanks

