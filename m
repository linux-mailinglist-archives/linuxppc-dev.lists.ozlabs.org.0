Return-Path: <linuxppc-dev+bounces-6596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A3A4AF47
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Mar 2025 05:41:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z58RC3bQnz30Wj;
	Sun,  2 Mar 2025 15:41:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740890487;
	cv=none; b=glyuHwcHPhGAXWxURthkBXwiG53x35wboGnNmcBCXfVtzPHEtb2JfwnUb5XFbUwJ+TjAvoTdXNsrDheGMULIZbBfw0fZLWoVrJU9iPaHupeHk2G3l4EMEeG70Yzkm2CIhvtHM4AbEHZPghQWj1PaUwYGM0HAJOc4S4pEhoySxCrXq3DqqUe87Vox9d8Ba/tN6j9WTUPs5l/deL9DYJBVC477QukKrYgLPOzTzZUlH4arWfqGpjPR8JVkBa3UFGQE3icD52uVpwg/JG9yDBhn06+zkTAhYO/542TSwuyCJ848n7jqwPAavtwFR/VyfZlzKtoqHpfV3WRlaW+QU5NHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740890487; c=relaxed/relaxed;
	bh=CoWBOvObzL9EJVp8HByGX04v1bDxGEY88MLNLpRCCo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hoR2D+RYq5JEuRadFLj2Gu2RJMt9ZffqlX8GxcBacQFY8hLf7pqEW7L2ldn/azdX3GLpbB3aBI+ab/nRYBHyGKPGdMzdfTygu8tmnHsstnPi+g/ugl4MQeLFM7RNSVJi3hAbSoq8ynRkAOsj3kEd3+POJ+lnaxiXcqwwrPFpoUQnKtzLGPE+XLbZZtqz5fgKbQNwcBTxEpr4IN8ZiViJjaJkR391fjhZgp43wg0GWlTW1bHfu5deLooxc/fAWjJxsbZWe19+yPY5UZXwhkJLM3cbU3Mwzru91Qa6X5orqEXIDoM55NXZMyscsiZcKBrq5Bb2nOGemP2FbElR0RUZBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N/iaDN3G; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N/iaDN3G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z58RB5Lfyz30CL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 15:41:26 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5221VAUb011444;
	Sun, 2 Mar 2025 04:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CoWBOv
	ObzL9EJVp8HByGX04v1bDxGEY88MLNLpRCCo8=; b=N/iaDN3GxctjIZduhn5NbQ
	glCFkPfAA2UsJc1yhsW84kCDDFjtuILt4UmOpBM1O3egu3yHwau+maDmtEILbQiQ
	Ir/NjqFNi7BEI/Fzw92jxPEJT1y90+riEq2z6/kf5qvIL4cnxi6wovSLfJEDCJPK
	TOL/TE6YlD8FCTupit5/r+fjAWP7pBsKm39/CGxfW6JuR2JF8G7KwmYe+i4bRy82
	ZM1s8X8C3FEtWFxg9ESW5NPY+Anqa9FDnf9hJq6/5t65Y/5nY/1wwDYBF84oL4ZQ
	k2ihAwaywgghtwyxzJTcGZOxRssSgpyrdPcxSTLejS79jbVGzDUAtq5HZzBgz0Tw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4542912s5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Mar 2025 04:40:46 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5224ejrY002364;
	Sun, 2 Mar 2025 04:40:45 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4542912s5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Mar 2025 04:40:45 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5222gSme020824;
	Sun, 2 Mar 2025 04:40:44 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 454esjgc5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Mar 2025 04:40:44 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5224egL147841734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 04:40:43 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC4D720043;
	Sun,  2 Mar 2025 04:40:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1609220040;
	Sun,  2 Mar 2025 04:40:34 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.83.152])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  2 Mar 2025 04:40:33 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 0/4] Implement inline static calls on PPC32 - v4
Date: Sun,  2 Mar 2025 10:10:30 +0530
Message-ID: <174089027712.25244.560287768025207621.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1733245362.git.christophe.leroy@csgroup.eu>
References: <cover.1733245362.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-GUID: pZ2PXWMrXkueT3DsQbLJaaMGmDo63Vt1
X-Proofpoint-ORIG-GUID: 3TyE20V3wWsdYlKZuNDbwQjw2LbM90L5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_10,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1011 spamscore=0
 phishscore=0 mlxlogscore=670 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503020031
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 03 Dec 2024 20:44:48 +0100, Christophe Leroy wrote:
> This series implements inline static calls on PPC32.
> 
> First patch adds to static_call core the ability to pass the
> trampoline address at the same time as the site address to
> arch_static_call_transform() so that it can fallback on branching to
> the trampoline when the site is too far (Max distance for direct
> branch is 32 Mbytes on powerpc).
> 
> [...]

Applied to powerpc/next.

[1/4] static_call_inline: Provide trampoline address when updating sites
      https://git.kernel.org/powerpc/c/d856bc3ac7d9ca88b3f52d8e08e58ce892dc3ce1
[2/4] objtool/powerpc: Add support for decoding all types of uncond branches
      https://git.kernel.org/powerpc/c/bb7f054f4de260dc14813230cfe4ca7299647b6e
[3/4] powerpc: Prepare arch_static_call_transform() for supporting inline static calls
      https://git.kernel.org/powerpc/c/6626f98ed55a7a20b1852e7d263a96d8f5a1b59f
[4/4] powerpc/static_call: Implement inline static calls
      https://git.kernel.org/powerpc/c/f50b45626e053dc10792c680cabbbadbf8c001e7

Thanks

