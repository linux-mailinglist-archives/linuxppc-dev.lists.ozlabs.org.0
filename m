Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9352A532744
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 12:16:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6qqF1chrz3c1r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:16:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CbdI0N6I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CbdI0N6I; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6qpX0y08z30D0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 20:15:47 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OA6mHZ014857;
 Tue, 24 May 2022 10:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=2XZ1WUugb0+bzkv/oIVhLNr19Fk0qAaWlx4k0tucVUo=;
 b=CbdI0N6INX3IgU8qoH2aCnho8huUEdIQGCjRIZas9SzT7rM4yLHiK3Pk8nyy9h3PTXVP
 8aqnX3CqWLXjzuqHuNiIfGQsGWdFLU/1buPqtfWH21hkB1ikwZ+FJBwdh1MUHbSxdb6M
 /9QkCdTWoINSZDnm3CR9/n3BcFKEAeKzRihASQxNHw7Eb4yTo5lQ7t2CDy9r2Tym5KCs
 Vm3fuVpwp38plo+u4cO211Dtv3eU67cdiftbUNPaNqSD7n9JssYIdniFw+OTAwlSRSaE
 G08feC/KaPysS6XAQbIajZZa5PhzaJ+t/b7HVkW58jB/xDFyWqojUf2TX2vqBie2W8m8 Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8v6j1gdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 10:15:27 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24OA9pex024172;
 Tue, 24 May 2022 10:15:27 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8v6j1gd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 10:15:27 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24OA8KdI005623;
 Tue, 24 May 2022 10:15:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3g6qq948fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 10:15:25 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24OAFMCp41877890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 10:15:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B39AB4204F;
 Tue, 24 May 2022 10:15:22 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F0C042041;
 Tue, 24 May 2022 10:15:22 +0000 (GMT)
Received: from localhost (unknown [9.199.154.182])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 May 2022 10:15:22 +0000 (GMT)
Date: Tue, 24 May 2022 15:45:20 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 1/4] objtool: Add --mnop as an option to --mcount
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-2-sv@linux.ibm.com>
 <26c7bfc8-3089-034a-70c0-8857d7cd3a99@csgroup.eu>
In-Reply-To: <26c7bfc8-3089-034a-70c0-8857d7cd3a99@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1653386854.o7nss9hzc9.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LcReRrfGxPgKstSwunxeCTJ3vHJvcc5b
X-Proofpoint-ORIG-GUID: foRDD5U1AKCkYPI3EQhEuPv_b1KM-j40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_06,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 mlxlogscore=828
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240051
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 23/05/2022 =C3=A0 19:55, Sathvika Vasireddy a =C3=A9crit=C2=A0:
>> Architectures can select HAVE_NOP_MCOUNT if they choose
>> to nop out mcount call sites. If that config option is
>> selected, then --mnop is passed as an option to objtool,
>> along with --mcount.
>>=20
>=20
> Is there a reason not to nop out mcount call sites on powerpc as well ?

Yes, if there are functions that are out of range of _mcount(), then the=20
linker would have inserted long branch trampolines. We detect such cases=20
during boot. But, if we nop out the _mcount call sites during build=20
time, we will need some other way to identify these.

- Naveen

