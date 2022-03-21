Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D68C64E239E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 10:50:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMVGH5Lyxz3bVW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 20:49:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GYn1f24r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GYn1f24r; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMVFX2XnSz3069
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 20:49:19 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L9KWjI009807; 
 Mon, 21 Mar 2022 09:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=uACQ4mkSEdVO1ltSwdh1bq5lSHA6sGk3PA6+HOFRvsA=;
 b=GYn1f24rmSnc173ghwIlGToYJIDx0TZn+fKgKDGEoMiezO58lQnG/90vRoF0eQxwIbFf
 a3saEKtEGkP6YXFBYbbdxf9xMHgN78Jx+58rFOrRv4YWOrbwPMVgTY5KAP5zEUEsRVr5
 eUcb1AQFBrfi1AGXcthjKm+BwZ1jWu+Z1U9/f7ARUmk75/gG1san+wi2sDsEHGpw4E2e
 suPTGcIyup67M1bs4q+a3czcjW0id5elCNZWqU3Y8p8nqKIh8gmu11qmu2BAWdEraQmM
 nnYV7URc4RAhuCy/t81/nrric7P5MdoxRNFYYybtRWSV9bxK49CNULPxxW+lMsyEEb9j lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exm1tuvx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 09:48:54 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22L9j28B010391;
 Mon, 21 Mar 2022 09:48:54 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exm1tuvwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 09:48:54 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L9hoZa016788;
 Mon, 21 Mar 2022 09:48:52 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3ew6t8k28g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 09:48:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22L9mnL738273404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 09:48:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB71311C04C;
 Mon, 21 Mar 2022 09:48:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5144611C050;
 Mon, 21 Mar 2022 09:48:49 +0000 (GMT)
Received: from localhost (unknown [9.43.115.88])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Mar 2022 09:48:49 +0000 (GMT)
Date: Mon, 21 Mar 2022 15:18:47 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 2/3] objtool: Enable and implement 'mcount' subcommand
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-3-sv@linux.ibm.com>
 <8e792a9a-afb8-9b26-5e97-8f51c72c2d42@csgroup.eu>
 <1647850610.961i89najm.naveen@linux.ibm.com>
 <b06bb9bc-22d1-acce-fe68-c7c4cb7c15b5@csgroup.eu>
In-Reply-To: <b06bb9bc-22d1-acce-fe68-c7c4cb7c15b5@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1647855901.ds85pb94ut.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tSHjZO6NQOGxCtFNq0VuINkfipUMz1Z4
X-Proofpoint-ORIG-GUID: EqM63D410yDYoN7YNS15IzG2TfN4GzYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_04,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=657
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210062
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 21/03/2022 =C3=A0 09:19, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>=20
>> We don't enable ftrace for vdso, so I suspect objtool run above will be=20
>> a no-op. This needs to be confirmed, of course.
>>=20
>=20
> I just checked without the series: recordmcount isn't run for VDSO, so=20
> objtool shouldn't be run either when the series is applied.

Agree. I was only pointing out that it would be harmless, but it is good=20
to ensure objtool is skipped for files/directories where ftrace isn't=20
enabled. recordmcount keys off the presence of CC_FLAGS_FTRACE, and we=20
should do the same for 'objtool --mcount'.


- Naveen
