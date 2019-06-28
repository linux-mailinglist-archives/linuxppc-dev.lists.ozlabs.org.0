Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C15A291
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 19:40:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b3vV24mQzDqgG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 03:40:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b3sp3spLzDqwf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 03:39:10 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SHaeFb132368
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 13:39:05 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tdn7ywehx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 13:39:05 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Fri, 28 Jun 2019 18:39:02 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 28 Jun 2019 18:39:00 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5SHcxPC37749130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 17:38:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBBEF5204E;
 Fri, 28 Jun 2019 17:38:59 +0000 (GMT)
Received: from localhost (unknown [9.199.49.147])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 65E4C5204F;
 Fri, 28 Jun 2019 17:38:59 +0000 (GMT)
Date: Fri, 28 Jun 2019 23:08:57 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries: Fix maximum memory value
To: Aravinda Prasad <aravinda@linux.vnet.ibm.com>, Nathan Lynch
 <nathanl@linux.ibm.com>
References: <156170480663.26214.11212383510892156924.stgit@aravinda>
 <87tvc9sjrb.fsf@linux.ibm.com>
In-Reply-To: <87tvc9sjrb.fsf@linux.ibm.com>
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19062817-0008-0000-0000-000002F81508
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062817-0009-0000-0000-00002265538D
Message-Id: <1561743225.hrre8pgw6j.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280202
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch wrote:
> Aravinda Prasad <aravinda@linux.vnet.ibm.com> writes:
>> Calculating the maximum memory based on the number of lmbs
>> and lmb size does not account for the RMA region. Hence
>> use memory_hotplug_max(), which already accounts for the
>> RMA region, to fetch the maximum memory value. Thanks to
>> Nathan Lynch for suggesting the memory_hotplug_max()
>> function.
>=20
> Well, I hope I haven't led you astray... will it give you the desired
> result on a kernel configured without memory hotplug support, booted in
> an LPAR with some huge pages configured?
>=20
> If so, then
> Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
>=20
> It would likely help with review and future maintenance if the semantics
> and intended use of the MaxMem field are made a little more
> explicit. For example, is it supposed to include persistent memory?
> Perhaps a follow-up patch could address this. Or maybe I'm overthinking
> it.

This was primarily aimed to replicate what AIX lparstat does and=20
documentation (*) just says:

  Maximum Memory
      Maximum possible amount of Memory.

I think this mirrors the maximum memory value set in the LPAR profile,=20
and this provides a way to obtain that value from within the LPAR.

This doesn't necessarily answer your question, but that's at least the=20
reference.

(*)=20
https://www.ibm.com/support/knowledgecenter/en/ssw_aix_72/com.ibm.aix.cmds3=
/lparstat.htm

- Naveen

=

