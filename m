Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F63D571B21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 15:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj1jK1Wrkz3c69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 23:25:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YQCXjN+z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YQCXjN+z;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lj1hc5S2wz3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 23:25:20 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CD5GUM002635;
	Tue, 12 Jul 2022 13:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YAEFtiMD5+u10/+PC1Fc0a9VR8y5YIWCiK8+QDE6278=;
 b=YQCXjN+zxjMWouvwYt0wSGdpTlAOYv62daxUtlavi8c2wXbU4HaE7cXBmXFhhv4neuKj
 IuLiUukqO6HSnQJcXyZKEU21BByKeh3ddRM0qTCnTk6BWuhMEx08/yo1YSvbShIWVLOf
 i6cu52ldc0XWvges4uJ/NiFIyIQh38ka8BZYXbxKQr+vXKv00eLL63v0f5ti14aqGALL
 noGYtkzRNoIoYCxr4/EDbepTFobko8Rb/KCCiB3hdWJPuPCDpDWSUl+r1jwuDfH1/1i8
 WKaHqiDJDLBIsiy7KUX2og7X+y58A1dPphySJKLB0FjapPvl5wBZfvjHrjYTCe8kDooW 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h99hh0pma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 13:25:04 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26CD6E4V007126;
	Tue, 12 Jul 2022 13:25:04 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h99hh0pkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 13:25:04 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26CDKX5e003548;
	Tue, 12 Jul 2022 13:25:03 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma03dal.us.ibm.com with ESMTP id 3h71a9kae9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 13:25:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26CDP19S13042006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Jul 2022 13:25:01 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4ADE78060;
	Tue, 12 Jul 2022 13:25:01 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F31C278063;
	Tue, 12 Jul 2022 13:25:00 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Tue, 12 Jul 2022 13:25:00 +0000 (GMT)
Message-ID: <3780329f-0197-0e47-81a1-22ceae28fd1c@linux.ibm.com>
Date: Tue, 12 Jul 2022 09:25:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 4/6] tpm: of: Make of-tree specific function commonly
 available
Content-Language: en-US
To: Mimi Zohar <zohar@linux.ibm.com>, kexec@lists.infradead.org,
        devicetree@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20220707172026.831614-1-stefanb@linux.ibm.com>
 <20220707172026.831614-5-stefanb@linux.ibm.com>
 <9fc4f6dc2ee497a4d4998df17392ac73ebdf3d63.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <9fc4f6dc2ee497a4d4998df17392ac73ebdf3d63.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zfIXDZutaERNnJii3LMuF_IWJx2l4fhv
X-Proofpoint-GUID: ywZSBDORtiUmK_Pr09djCcNdU0Gi5d3h
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_08,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=953
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120051
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
Cc: nayna@linux.ibm.com, Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/11/22 18:04, Mimi Zohar wrote:
> Hi Stefan,
> 
> On Thu, 2022-07-07 at 13:20 -0400, Stefan Berger wrote:
>> -       /*
>> -        * For both vtpm/tpm, firmware has log addr and log size in big
>> -        * endian format. But in case of vtpm, there is a method called
>> -        * sml-handover which is run during kernel init even before
>> -        * device tree is setup. This sml-handover function takes care
>> -        * of endianness and writes to sml-base and sml-size in little
>> -        * endian format. For this reason, vtpm doesn't need conversion
>> -        * but physical tpm needs the conversion.
>> -        */
> 
> This comment is dropped.  Perhaps not in such detail, but shouldn't a
> comment or function description exist in the new function.

I am adding back the comment in v7.

> 
> Otherwise,
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> 
> thanks,
> 
> Mimi
> 
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
