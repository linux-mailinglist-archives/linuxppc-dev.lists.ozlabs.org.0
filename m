Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BFFB17E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 07:46:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46V4QP3cXtzF568
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 15:46:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46V4NG6b1tzF3s3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 15:45:02 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8D5bGvI076887
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 01:44:59 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v03x325n1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 01:44:59 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 13 Sep 2019 06:44:57 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Sep 2019 06:44:54 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8D5irlp32309396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 05:44:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C881C4204B;
 Fri, 13 Sep 2019 05:44:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A319042042;
 Fri, 13 Sep 2019 05:44:52 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.122.211.212])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 13 Sep 2019 05:44:52 +0000 (GMT)
Date: Fri, 13 Sep 2019 11:14:51 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v3 3/5] powerpc/numa: Use cpu node map of first sibling
 thread
References: <20190906135020.19772-1-srikar@linux.vnet.ibm.com>
 <20190906135020.19772-4-srikar@linux.vnet.ibm.com>
 <87lfuurirh.fsf@linux.ibm.com>
 <20190911165845.GA31643@linux.vnet.ibm.com>
 <87ftl1qxey.fsf@linux.ibm.com>
 <20190912171751.GA16497@linux.vnet.ibm.com>
 <87d0g5qt3s.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87d0g5qt3s.fsf@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-TM-AS-GCONF: 00
x-cbid: 19091305-0020-0000-0000-0000036BB946
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091305-0021-0000-0000-000021C14E37
Message-Id: <20190913021649.GA23865@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130057
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nathan Lynch <nathanl@linux.ibm.com> [2019-09-12 13:15:03]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> 
> >> 
> >> I think just WARN_ON(cpu_online(fcpu)) would be satisfactory. In my
> >> experience, the downstream effects of violating this condition are
> >> varied and quite difficult to debug. Seems only appropriate to emit a
> >> warning and stack trace before the OS inevitably becomes unstable.
> >
> > I still have to try but wouldn't this be a problem for the boot-cpu?
> > I mean boot-cpu would be marked online while it tries to do numa_setup_cpu.
> > No?
> 
> This is what I mean:
> 
>  +      if (fcpu != lcpu) {
>  +              WARN_ON(cpu_online(fcpu));
>  +              map_cpu_to_node(fcpu, nid);
>  +      }
> 

Yes this should work. Will send an updated patch with this change.

> I.e. if we're modifying the mapping for a remote cpu, warn if it's
> online.
> 
> I don't think this would warn on the boot cpu -- I would expect fcpu and
> lcpu to be the same and this branch would not be taken.

-- 
Thanks and Regards
Srikar Dronamraju

