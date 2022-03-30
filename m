Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EEF4ECC89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 20:41:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTFdX3s6Rz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 05:41:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JnndgLnU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JnndgLnU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTFcq27LDz2yMK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 05:40:58 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UI0JUA028229; 
 Wed, 30 Mar 2022 18:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yYaqFrYKOsWX0AAm5jWdnXfpOzmVYQfexOdLzGH70SM=;
 b=JnndgLnUoVoqFUh3c+uTA+ZqCtaSypIDZk1GaVB+Lc24wq/Ohbt7ojtzG2IdlgfAaVmq
 b231O5PDrITVeBBsr+t17ja3mqv6vwkQEv4JwVJr6Jdn+9z7Lg9Imc3mWXRXI1esS3qB
 wKyH3kDP+Qe+tqI/rPtyxOzX+DRA8klUcERXqjQOXeAZyHLteRFjcnZM4Iplna/eqr1E
 jnypdRlUo0p6hZyVt9TBJPxA+4wkuly8LgxfP5mffi6hYQQfE3PuGlvA5X1bkO/wTcuJ
 i1QCa9bzpvlHoCpvZ7vPYMny73eykBAjPJ8ZDak7KFW8OQsTaqKdJ86XsIqCV9y95zj+ Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4v3vgq71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 18:40:26 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UILvrc015655;
 Wed, 30 Mar 2022 18:40:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4v3vgq6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 18:40:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UIXYRv024126;
 Wed, 30 Mar 2022 18:40:24 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3f1tf9h5c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 18:40:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UIeMib21758426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 18:40:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17866A405B;
 Wed, 30 Mar 2022 18:40:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD030A4054;
 Wed, 30 Mar 2022 18:40:21 +0000 (GMT)
Received: from localhost (unknown [9.43.30.177])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Mar 2022 18:40:21 +0000 (GMT)
Date: Thu, 31 Mar 2022 00:10:20 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
 <20220328195920.dqlfra3lcardko6r@treble> <87mth9ezml.fsf@mpe.ellerman.id.au>
 <af262c28-0d73-7ae6-3dd5-2977c9a41f7d@csgroup.eu>
In-Reply-To: <af262c28-0d73-7ae6-3dd5-2977c9a41f7d@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1648665137.s2tuu8nsoa.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FtdX2iafIxDAA4x2CAq9ARVm1EQ0W8bq
X-Proofpoint-ORIG-GUID: C0IxmeimH_DRK4fHLec3HEyj_muH7uYI
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_06,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203300090
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
 Peter Zijlstra <peterz@infradead.org>, Sathvika Vasireddy <sv@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 29/03/2022 =C3=A0 14:01, Michael Ellerman a =C3=A9crit=C2=A0:
>> Josh Poimboeuf <jpoimboe@redhat.com> writes:
>>> On Sun, Mar 27, 2022 at 09:09:20AM +0000, Christophe Leroy wrote:
>>>> What are current works in progress on objtool ? Should I wait Josh's
>>>> changes before starting looking at all this ? Should I wait for anythi=
ng
>>>> else ?
>>>
>>> I'm not making any major changes to the code, just shuffling things
>>> around to make the interface more modular.  I hope to have something
>>> soon (this week).  Peter recently added a big feature (Intel IBT) which
>>> is already in -next.
>>>
>>> Contributions are welcome, with the understanding that you'll help
>>> maintain it ;-)
>>>
>>> Some years ago Kamalesh Babulal had a prototype of objtool for ppc64le
>>> which did the full stack validation.  I'm not sure what ever became of
>>> that.
>>=20
>>  From memory he was starting to clean the patches up in late 2019, but I
>> guess that probably got derailed by COVID. AFAIK he never posted
>> anything. Maybe someone at IBM has a copy internally (Naveen?).

Kamalesh had a WIP series to enable stack validation on powerpc. From=20
what I recall, he was waiting on and/or working with the arm64 folks=20
around some of the common changes needed in objtool.

>>=20
>>> FWIW, there have been some objtool patches for arm64 stack validation,
>>> but the arm64 maintainers have been hesitant to get on board with
>>> objtool, as it brings a certain maintenance burden.  Especially for the
>>> full stack validation and ORC unwinder.  But if you only want inline
>>> static calls and/or mcount then it'd probably be much easier to
>>> maintain.
>>=20
>> I would like to have the stack validation, but I am also worried about
>> the maintenance burden.
>>=20
>> I guess we start with mcount, which looks pretty minimal judging by this
>> series, and see how we go from there.
>>=20
>=20
> I'm not sure mcount is really needed as we have recordmcount, but at=20
> least it is an easy one to start with and as we have recordmount we can=20
> easily compare the results and check it works as expected.

On the contrary, I think support for mcount in objtool is something we=20
want to get going soon (hopefully, in time for v5.19) given the issues=20
we are seeing with recordmcount:
- https://github.com/linuxppc/issues/issues/388
- https://lore.kernel.org/all/20220211014313.1790140-1-aik@ozlabs.ru/


- Naveen

