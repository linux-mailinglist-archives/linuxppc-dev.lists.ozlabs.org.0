Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2660781CC12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 16:18:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CoiTB7gi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxWCk5hNjz3cYw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 02:18:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CoiTB7gi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=imbrenda@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxWBr5qNJz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Dec 2023 02:17:56 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BMEEQDr030339;
	Fri, 22 Dec 2023 15:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=d4+FFRh9BeZ5ad/M9qyQ0UvAg9QjTqEuVZsmPLq+Gj0=;
 b=CoiTB7gip12mKbwhO4iS/drglt9R1YXgQvnb5lBznp/wCFtvbiqhgO4HJZTC5JLvSyP8
 uy/qN82K4osJ7XPSOKXw8LZEbAb47vfIlXX1zgJZZoLRgcAcbuWWbfN1V3LIh2eAms48
 YVyXf2ADM1HE+PmqaOYI3wcR1J+RWV1kDc/5xG4wTd1RtLuiUQP0opDM4BbjXHPleup+
 ExGOTAm43vtfnXsy1KC9FmAWmmeI6M1mhUc9KVqXSu5Yoy5v3Xqhw/lnKbb3GnZmkiWg
 TOunm+Nl/dgVRszKGMsMgHfTTX+WSuiZvYzzxVJ2vlpGrmTpctR6xEKZ3pQjGoYQIWaP Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v5afmkfqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Dec 2023 15:17:39 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BMFBM8w011899;
	Fri, 22 Dec 2023 15:17:39 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v5afmkf58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Dec 2023 15:17:39 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BMEa9fm012313;
	Fri, 22 Dec 2023 15:16:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3v1rx2bek2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Dec 2023 15:15:59 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BMFFvR133882386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Dec 2023 15:15:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F06182004E;
	Fri, 22 Dec 2023 15:15:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2086E20043;
	Fri, 22 Dec 2023 15:15:56 +0000 (GMT)
Received: from p-imbrenda (unknown [9.179.5.15])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri, 22 Dec 2023 15:15:56 +0000 (GMT)
Date: Fri, 22 Dec 2023 16:15:49 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 9/9] migration: add a migration selftest
Message-ID: <20231222161549.6fed1b71@p-imbrenda>
In-Reply-To: <20231222135048.1924672-10-npiggin@gmail.com>
References: <20231222135048.1924672-1-npiggin@gmail.com>
	<20231222135048.1924672-10-npiggin@gmail.com>
Organization: IBM
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JCQSn4a2epfoyIOHOrRODpJXroktbMDc
X-Proofpoint-ORIG-GUID: DecLRSh3UUACpUuv2MFkzU5zne3b7qe8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-22_09,2023-12-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1011 mlxlogscore=918 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312220112
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 22 Dec 2023 23:50:48 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> Add a selftest for migration support in  guest library and test harness
> code. It performs migrations a tight loop to irritate races, and has
> flushed out several bugs in developing in the complicated test harness
> migration code already.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

for s390x:

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

[...]
