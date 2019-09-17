Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81537B5465
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 19:39:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xr2M0FRLzF3P4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 03:39:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xqzn3KG3zF45V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 03:36:53 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HHWF4d095188; Tue, 17 Sep 2019 13:36:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v32ccv21d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 13:36:42 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8HHWVnO095770;
 Tue, 17 Sep 2019 13:36:41 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v32ccv1xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 13:36:40 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8HHZblL023544;
 Tue, 17 Sep 2019 17:36:38 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2v0svqs7bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 17:36:38 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HHaZAM67043770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 17:36:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A413EBE05F;
 Tue, 17 Sep 2019 17:36:35 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C0FEBE054;
 Tue, 17 Sep 2019 17:36:35 +0000 (GMT)
Received: from localhost (unknown [9.41.179.186])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 17:36:35 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] pseries/hotplug: Change the default behaviour of
 cede_offline
In-Reply-To: <20190915074217.GA943@in.ibm.com>
References: <1568284541-15169-1-git-send-email-ego@linux.vnet.ibm.com>
 <87impxr0am.fsf@linux.ibm.com> <20190915074217.GA943@in.ibm.com>
Date: Tue, 17 Sep 2019 12:36:35 -0500
Message-ID: <87a7b2rfj0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=892 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170168
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Kamalesh Babulal <kamaleshb@in.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R Shenoy <ego@linux.vnet.ibm.com> writes:
> On Thu, Sep 12, 2019 at 10:39:45AM -0500, Nathan Lynch wrote:
>> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
>> > The patchset also defines a new sysfs attribute
>> > "/sys/device/system/cpu/cede_offline_enabled" on PSeries Linux guests
>> > to allow userspace programs to change the state into which the
>> > offlined CPU need to be put to at runtime.
>> 
>> A boolean sysfs interface will become awkward if we need to add another
>> mode in the future.
>> 
>> What do you think about naming the attribute something like
>> 'offline_mode', with the possible values 'extended-cede' and
>> 'rtas-stopped'?
>
> We can do that. However, IMHO in the longer term, on PSeries guests,
> we should have only one offline state - rtas-stopped.  The reason for
> this being, that on Linux, SMT switch is brought into effect through
> the CPU Hotplug interface. The only state in which the SMT switch will
> recognized by the hypervisors such as PHYP is rtas-stopped.

OK. Why "longer term" though, instead of doing it now?


> All other states (such as extended-cede) should in the long-term be
> exposed via the cpuidle interface.
>
> With this in mind, I made the sysfs interface boolean to mirror the
> current "cede_offline" commandline parameter. Eventually when we have
> only one offline-state, we can deprecate the commandline parameter as
> well as the sysfs interface.

I don't care for adding a sysfs interface that is intended from the
beginning to become vestigial...

This strikes me as unnecessarily incremental if you're changing the
default offline state. Any user space programs depending on the current
behavior will have to change anyway (and why is it OK to break them?)

Why isn't the plan:

  1. Add extended cede support to the pseries cpuidle driver
  2. Make stop-self the only cpu offline state for pseries (no sysfs
     interface necessary)

?
