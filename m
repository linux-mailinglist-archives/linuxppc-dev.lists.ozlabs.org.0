Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 271875967AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 05:11:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6tML6qK6z3drn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 13:11:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rDcUEXTt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rDcUEXTt;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6tL01kwlz2xHw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 13:09:59 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27H0VAZA024866;
	Wed, 17 Aug 2022 03:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=RyRDKBibkT//ZAkcIWN57heGt8XStJVNoR2Xs9VsIfQ=;
 b=rDcUEXTtkyeRKJJbeTPxEjRE5MYaMNyJUhlAyFOLdO/jFfxhR9p5RTTPmofrZA7GhZWn
 wXm0EdOPLoEWMtHzZxTZY5/dqhvkkiWdREFPoeNDmGpCSLO+oIEhoPNbYPfmUl8UD405
 Z3S7D9brYT214f4CFx9bzJfJU7wVT4ptslL30LM4Rc5fIcYmolOmfNWvOHd7O3hYSaIa
 p3L700C5JuDhXpSELVxxg3j1WnWq+SZIpaN16oSrv3QO+r9opzVWQsR7vKa+ZwfAhdpS
 9s/I0tUDYADS+vAuIzXqb1zQR1Fs3+QChDYbHY4VFy7CIOudACj6N1NrTFTaFQmDNPvp tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0nmk3dvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 03:09:56 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27H39tMl011885;
	Wed, 17 Aug 2022 03:09:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0nmk3dv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 03:09:55 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27H36bXu020385;
	Wed, 17 Aug 2022 03:09:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3hx3k8uvqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 03:09:53 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27H3A9Xl36503824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Aug 2022 03:10:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F113B4203F;
	Wed, 17 Aug 2022 03:09:50 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AE9D42041;
	Wed, 17 Aug 2022 03:09:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 17 Aug 2022 03:09:50 +0000 (GMT)
Received: from [9.43.185.126] (unknown [9.43.185.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6B36D602FE;
	Wed, 17 Aug 2022 13:09:47 +1000 (AEST)
Message-ID: <8c320ae1b88fd72dda3da6086d0742d3289f002f.camel@linux.ibm.com>
Subject: Re: [PATCH] gcc-plugins: Undefine LATENT_ENTROPY_PLUGIN when plugin
 disabled for a file
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Kees Cook <keescook@chromium.org>, linuxppc-dev@lists.ozlabs.org,
        linux-hardening@vger.kernel.org
Date: Wed, 17 Aug 2022 13:09:44 +1000
In-Reply-To: <166067790682.7084.237943534143309650.b4-ty@chromium.org>
References: <20220816051720.44108-1-ajd@linux.ibm.com>
	 <166067790682.7084.237943534143309650.b4-ty@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9Sqa-0dMlTek2XRKYOf0h5GKMoY0eNBa
X-Proofpoint-GUID: C4LLSrFRl4uAubCuu4JHi0dWQ9WVRdf4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_02,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=922 suspectscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170011
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
Cc: erhard_f@mailbox.org, yury.norov@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-08-16 at 12:25 -0700, Kees Cook wrote:
> Applied to for-next/hardening, thanks!
> 
> [1/1] gcc-plugins: Undefine LATENT_ENTROPY_PLUGIN when plugin
> disabled for a file
>       https://git.kernel.org/kees/c/2d08c71d2c79
> 

Thanks Kees!

Can we make sure this lands in rc2?

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

