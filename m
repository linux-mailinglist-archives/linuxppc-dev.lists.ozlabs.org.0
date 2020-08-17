Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3A3245EDC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:08:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVRWH5LyZzDqRb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:08:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lOAIwZ6C; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRT4557TzDq63
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:06:28 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07H81U6S088239; Mon, 17 Aug 2020 04:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=X07FvFb0QfIASln5B97rfeHj9PpOEHmY/M1fLCCLXdI=;
 b=lOAIwZ6C5ugZiiO3+2bAGdPZ6gPHdgi/WYlBdSRf756AdpK0Qag9rE/qT/i1uQIFQPB9
 T589z/740xkaqxnKhl1aBjkTFbqF5whV2ZW66vFVsofpQW9mPdpuECQhN4EuZOrrD5Pp
 i7aBaHzgvd2KLIN3pO1UxD7QMzUSXnkjVrF8xYJ7GK+bHcpsQeaASc7BTA6UuhIOpowY
 U43AWTU051ED4WSTgNMlqzuumABr84U1Y5aNTqndTTb4VoazWdkVzVGcDrTRZMLke/2k
 sP5px7yJdb9Mxk8OeHgGku2uJdquP091k5+/13PP+UcXE4pmRQpvZW5lRzHJftfRLJFb AA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y5s7acmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 04:06:11 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07H85gdc004000;
 Mon, 17 Aug 2020 08:05:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 32x7b8208b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 08:05:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07H85hf922413736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 08:05:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E051F4203F;
 Mon, 17 Aug 2020 08:05:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 884E442045;
 Mon, 17 Aug 2020 08:05:42 +0000 (GMT)
Received: from localhost (unknown [9.102.3.68])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 08:05:42 +0000 (GMT)
Date: Mon, 17 Aug 2020 13:35:42 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v1] powerpc/process: Remove unnecessary #ifdef
 CONFIG_FUNCTION_GRAPH_TRACER
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <9d11143d4e27ba8274369a926968756917584868.1597643153.git.christophe.leroy@csgroup.eu>
In-Reply-To: <9d11143d4e27ba8274369a926968756917584868.1597643153.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1597651522.loa8bqu8s9.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_02:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 mlxlogscore=879
 suspectscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008170059
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> ftrace_graph_ret_addr() is always defined and returns 'ip' when
> CONFIG_FUNCTION GRAPH_TRACER is not set.
>=20
> So the #ifdef is not needed, remove it.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/process.c | 4 ----
>  1 file changed, 4 deletions(-)

LGTM.
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

- Naveen

