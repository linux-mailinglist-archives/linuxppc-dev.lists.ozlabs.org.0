Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E67593008
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 15:35:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5wJN6WHQz3c69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 23:35:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K+vfDuUO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K+vfDuUO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5wHg392Vz2x9G
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 23:34:38 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FDEIQ1027150;
	Mon, 15 Aug 2022 13:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uZ/gxg4vwNI6HXYTM5WtTwqBD5xiz145jUdLuTNzlO8=;
 b=K+vfDuUO+MnNMVtKMlY95pl7vMYTvxjNayVwBZPhe91x8k0IjdiCAxhUEmY4eyymlahh
 xUx/DwupRRNVtajezziJOYoHrmOL69zoivO8lPv2crRN4is4pFOphY/wRRiPiOwzMwqi
 6rWDwM/B1BaFWUgBTggMmY88b6EhW3tDO89JB0pF03An5VOmXtbd6EgWDsCFbPzFQM6Q
 uZvGzoqtSAIk+sQZkzQz290aHr2cCMFGKfCUdQiw1i4M46leqJKQs36E3RicJtSRgvIw
 DlaQNyowDfmowsIkE2nBg/HlYfdFukxsVyLa2IyngNjOp0ecwHknE8Hflk/pe6BDkU7R jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hyny39s47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Aug 2022 13:32:22 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27FDTcdW019263;
	Mon, 15 Aug 2022 13:32:21 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hyny39s3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Aug 2022 13:32:21 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27FDM3Qr006945;
	Mon, 15 Aug 2022 13:32:20 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma01dal.us.ibm.com with ESMTP id 3hx3ka76kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Aug 2022 13:32:20 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27FDWJVB35913988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Aug 2022 13:32:19 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A55ECB2068;
	Mon, 15 Aug 2022 13:32:19 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EE68B2064;
	Mon, 15 Aug 2022 13:32:19 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon, 15 Aug 2022 13:32:19 +0000 (GMT)
Message-ID: <94d1ba97-3fcf-bb75-ce3e-d6a8ca712ece@linux.ibm.com>
Date: Mon, 15 Aug 2022 09:32:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 0/6] tpm: Preserve TPM measurement log across kexec
 (ppc64)
Content-Language: en-US
To: Coiby Xu <coxu@redhat.com>
References: <20220812164305.2056641-1-stefanb@linux.ibm.com>
 <20220815064813.77g6icbkygrbmapa@Rk>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220815064813.77g6icbkygrbmapa@Rk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4ptO3BKkSCoh7-5bQX2n7qnM51LmKpyR
X-Proofpoint-ORIG-GUID: SjJwR0iv4r6SJJUKhXKap-xyAeb2ZD_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208150051
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
Cc: devicetree@vger.kernel.org, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/15/22 02:48, Coiby Xu wrote:
> I can confirm this patch set fixes an issue that guest kdump kernel
> crashes on POWER9 host by applying it to 5.19.1 (there is a conflict
> when applying this patch set to latest kernel i.e. 6.0.0-rc1)

I rebased it. 2 of the borrowed patches disappeared now since they are 
upstream already and the rest applied without conflict...

> 
> Tested-by: Coiby Xu <coxu@redhat.com>

Thanks.
