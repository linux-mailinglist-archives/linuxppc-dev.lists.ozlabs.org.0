Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC377590D4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 10:20:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3xSz57tqz3bm9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 18:20:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jGpOV5b/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jGpOV5b/;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3xSD6zwkz2xGx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 18:20:12 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27C899cn024680
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 08:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type : mime-version
 : content-transfer-encoding; s=pp1;
 bh=uxdX4TRFWpJ8Et50n7e4IYGljkFz2Qhdnuu94XJIafA=;
 b=jGpOV5b/zT4N0d8wZbISda7o+FcaiucnNNsKEUMBQn+vayjBuieS6XURCoPlaJ/qhXy9
 vLTgflWgOKR2h9IkMV+T+2tSdUNVgAF3cMF7mPJMLcVjXVAiY7uZcWR40jEQoxCCcP7h
 FX9+2Dh13X+hhi0EifrW41SFUX3bEQKyRJZblchMF2vnUngfB2QCUyQ/JXvNWpJPrkpy
 Ej3bL5mtaWejAlUI8OaESupgazpognJdDPkhu0y7Eg88ACKiR2DJli9FP8kYH7RoBHar
 mBgqJ3iH77sZomZOY98RQ3Xiq/GND2+kLasB2UxhyOJpaDpPzmkZX52dPJLUOfpa9uMq qw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwjqfrxj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 08:20:09 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27C88Hvo023566
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 08:20:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma02fra.de.ibm.com with ESMTP id 3huww0tea6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 08:20:07 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27C8K5KB26542530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 08:20:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D32DAE04D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 08:20:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB1FBAE053
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 08:20:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 08:20:04 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 21ADA600F5;
	Fri, 12 Aug 2022 18:19:52 +1000 (AEST)
Message-ID: <e4e4bd479bd9a7f03fdd6c646bc52d33b64e3ba0.camel@linux.ibm.com>
Subject: Re: [PATCH] docs: powerpc: add POWER9 and POWER10 to CPU families
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 18:19:51 +1000
In-Reply-To: <20220810040321.375396-1-nicholas@linux.ibm.com>
References: <20220810040321.375396-1-nicholas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ksbtENU9AZYnn95tF4Xbs6A0WP9DLUxp
X-Proofpoint-GUID: ksbtENU9AZYnn95tF4Xbs6A0WP9DLUxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=791 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208120021
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-08-10 at 04:03 +0000, Nicholas Miehlbradt wrote:
> Add POWER9 and POWER10 to CPU families and list Radix MMU.
> 
> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>


-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

