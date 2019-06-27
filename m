Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A816B579D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 05:01:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z4Qy75CDzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 13:00:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z4Nk1131zDqNB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 12:59:01 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5R2vPZu103851
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 22:58:59 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tchd5qt7p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 22:58:59 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Thu, 27 Jun 2019 03:58:57 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Jun 2019 03:58:54 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5R2wr5341615672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 02:58:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1858211C04C;
 Thu, 27 Jun 2019 02:58:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 476BA11C04A;
 Thu, 27 Jun 2019 02:58:51 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.57.198])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jun 2019 02:58:50 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/papr_scm: Force a scm-unbind if initial
 scm-bind fails
In-Reply-To: <CAOSf1CEPZcq-hkJCxRnb7nZ8Smib6uDm6J_Lp6ec5sP7+DQDEQ@mail.gmail.com>
References: <20190626140404.27448-1-vaibhav@linux.ibm.com>
 <20190626140404.27448-4-vaibhav@linux.ibm.com> <87k1d8z3jw.fsf@linux.ibm.com>
 <CAOSf1CEPZcq-hkJCxRnb7nZ8Smib6uDm6J_Lp6ec5sP7+DQDEQ@mail.gmail.com>
Date: Thu, 27 Jun 2019 08:26:54 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19062702-0020-0000-0000-0000034DBA5F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062702-0021-0000-0000-000021A13282
Message-Id: <87h88bzqfd.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=426 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270033
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:


> As I said in the comments on v1, do we have any actual numbers on how
> long the bind step takes? From memory, you could bind ~32GB in a
> single bind h-call before phyp would hit it's time limit of 250us and
> return a continue token. Assuming that holds we'll be saving a few
> dozen milliseconds at best.
>
>> > +             rc = drc_pmem_bind(p);
>> > +     }
>> > +
>> >       if (rc)
>> >               goto err;
>> >
>>
>> I am also not sure about the module reference count here. Should we
>> increment the module reference count after a bind so that we can track
>> failures in ubind and fail the module unload?
>
> I don't really get what you're concerned about here. The error
> handling path calls drc_pmem_unbind() so if there's a bind error we
> should never leave probe with memory still bound.
>

In the remove callback, if the ubind fail should we allow the module
unload?

-aneesh

