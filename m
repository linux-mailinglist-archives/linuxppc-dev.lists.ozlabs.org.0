Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 732E62A52D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 17:52:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45B75n2S9XzDqQc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2019 01:51:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=paulmck@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45B74Y20PGzDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2019 01:50:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4PFgHTR140366
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 11:50:43 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sq10pbefq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 11:50:42 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <paulmck@linux.vnet.ibm.com>;
 Sat, 25 May 2019 16:50:41 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 25 May 2019 16:50:35 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4PFoYP633227200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 25 May 2019 15:50:34 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EC8CB206A;
 Sat, 25 May 2019 15:50:34 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D0D0B205F;
 Sat, 25 May 2019 15:50:34 +0000 (GMT)
Received: from paulmck-ThinkPad-W541 (unknown [9.80.199.73])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 25 May 2019 15:50:34 +0000 (GMT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
 id 1DB1C16C32DC; Sat, 25 May 2019 08:50:35 -0700 (PDT)
Date: Sat, 25 May 2019 08:50:35 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH RFC 0/5] Remove some notrace RCU APIs
References: <20190524234933.5133-1-joel@joelfernandes.org>
 <20190524232458.4bcf4eb4@gandalf.local.home>
 <20190525081444.GC197789@google.com>
 <20190525070826.16f76ee7@gandalf.local.home>
 <20190525141954.GA176647@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525141954.GA176647@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19052515-0060-0000-0000-00000347D01F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011161; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01208442; UDB=6.00634729; IPR=6.00989440; 
 MB=3.00027049; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-25 15:50:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052515-0061-0000-0000-0000497ECEE0
Message-Id: <20190525155035.GE28207@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-25_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905250110
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
Reply-To: paulmck@linux.ibm.com
Cc: rcu@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Ingo Molnar <mingo@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 25, 2019 at 10:19:54AM -0400, Joel Fernandes wrote:
> On Sat, May 25, 2019 at 07:08:26AM -0400, Steven Rostedt wrote:
> > On Sat, 25 May 2019 04:14:44 -0400
> > Joel Fernandes <joel@joelfernandes.org> wrote:
> > 
> > > > I guess the difference between the _raw_notrace and just _raw variants
> > > > is that _notrace ones do a rcu_check_sparse(). Don't we want to keep
> > > > that check?  
> > > 
> > > This is true.
> > > 
> > > Since the users of _raw_notrace are very few, is it worth keeping this API
> > > just for sparse checking? The API naming is also confusing. I was expecting
> > > _raw_notrace to do fewer checks than _raw, instead of more. Honestly, I just
> > > want to nuke _raw_notrace as done in this series and later we can introduce a
> > > sparse checking version of _raw if need-be. The other option could be to
> > > always do sparse checking for _raw however that used to be the case and got
> > > changed in http://lists.infradead.org/pipermail/linux-afs/2016-July/001016.html
> > 
> > What if we just rename _raw to _raw_nocheck, and _raw_notrace to _raw ?
> 
> That would also mean changing 160 usages of _raw to _raw_nocheck in the
> kernel :-/.
> 
> The tracing usage of _raw_notrace is only like 2 or 3 users. Can we just call
> rcu_check_sparse directly in the calling code for those and eliminate the APIs?
> 
> I wonder what Paul thinks about the matter as well.

My thought is that it is likely that a goodly number of the current uses
of _raw should really be some form of _check, with lockdep expressions
spelled out.  Not that working out what exactly those lockdep expressions
should be is necessarily a trivial undertaking.  ;-)

That aside, if we are going to change the name of an API that is
used 160 places throughout the tree, we would need to have a pretty
good justification.  Without such a justification, it will just look
like pointless churn to the various developers and maintainers on the
receiving end of the patches.

							Thanx, Paul

> thanks, Steven!
> 

