Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5DB5F5FC7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 05:52:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjcwC4N0Mz3bmK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 14:52:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZImmlChn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZImmlChn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjcvD3XHSz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 14:51:52 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2963g5BY039121;
	Thu, 6 Oct 2022 03:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=NSD5xFVUaUjsoowN5XYFwTnqf8W/lJrRKrOhVzqhziw=;
 b=ZImmlChnIG3nfoafcxi96cVtLJOJGME/ihtdES862J6ZUHKd4GESMWwzy++ySKLIra9s
 zyCkIK0NJuLljjn0SRi0yEcZwlbk8yLZynVRFzPudnAzHJgv3S0PLMjjMxEWBEFecQyg
 SUDH3cLS8GcYc/KmTOybTIa5h+oq5xXOktKGchP6dl0ilGxV7Rszn8Z7+jFKVOfT+3ke
 VBgVxCaVTtf9yKJl3aKvb2DypuiUN4ELtvBvfBXaeD000gP4K5hh1AE4F8dB69lgA8OR
 oTdhcTEpADKSg2+Z/rYP3gP+zc243SvM/yEBVX5GO6y3SLTVWujR9OsDpvLLQf5rpsaV JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1qbd85p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 03:51:36 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2963pZuK027984;
	Thu, 6 Oct 2022 03:51:35 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1qbd85nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 03:51:35 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2963okHS032288;
	Thu, 6 Oct 2022 03:51:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06fra.de.ibm.com with ESMTP id 3jxcthvpwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 03:51:32 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2963q08Y53084646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 03:52:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8718A52050;
	Thu,  6 Oct 2022 03:51:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3096A5204F;
	Thu,  6 Oct 2022 03:51:30 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0CA1A6010A;
	Thu,  6 Oct 2022 14:51:22 +1100 (AEDT)
Message-ID: <070380438420cbfbf21b169839355bcf3b14e326.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/6] powerpc/module: Handle caller-saved TOC in
 module linker
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Benjamin Gray
	 <bgray@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 06 Oct 2022 14:51:14 +1100
In-Reply-To: <3e411080-5f68-1ec8-b2fd-bb508a81078a@csgroup.eu>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
	 <20221005053234.29312-3-bgray@linux.ibm.com>
	 <3e411080-5f68-1ec8-b2fd-bb508a81078a@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w62OJLlavtq1nwitqsPlX1rNGS3bJR3a
X-Proofpoint-ORIG-GUID: TzrPYpPlBo7m97fK8Q9rBRvlLhIpOErY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=665 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060020
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-10-05 at 19:18 +0000, Christophe Leroy wrote:
> 
> 
> Le 05/10/2022 à 07:32, Benjamin Gray a écrit :
> > The callee may set a field in st_other to 1 to indicate r2 should
> > be
> > treated as caller-saved. This means a trampoline must be used to
> > save
> > the current TOC before calling it and restore it afterwards, much
> > like
> > external calls.
> 
> The 'callee', what is that here in that context ?
> 
> Don't you mean the 'linker' instead ?

Should probably explain explicitly that this is the .localentry NAME, 1
directive.

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

