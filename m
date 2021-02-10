Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7646315E25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 05:18:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db62Y4gNFzDvZn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 15:18:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=codefail.de (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db60c0wsFzDr1G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 15:17:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11A434xJ040030; Tue, 9 Feb 2021 23:16:53 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36m7r80q7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 23:16:52 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11A46xOE012887;
 Wed, 10 Feb 2021 04:16:51 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 36hjr9kfg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 04:16:51 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11A4GoDR38404424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 04:16:50 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 555DF136055;
 Wed, 10 Feb 2021 04:16:50 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CE1413605D;
 Wed, 10 Feb 2021 04:16:50 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.80.193.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 10 Feb 2021 04:16:50 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 1121BBC0F03;
 Tue,  9 Feb 2021 22:16:48 -0600 (CST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Feb 2021 22:16:48 -0600
Message-Id: <C95K6K4GPG59.X13OH51FZ2R3@oc8246131445.ibm.com>
Subject: Re: [PATCH v5 10/10] powerpc/signal64: Use __get_user() to copy
 sigset_t
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-11-cmr@codefail.de>
 <20210209224556.Horde.RYCA-pbjVpbTsRo_x8_Msg8@messagerie.c-s.fr>
In-Reply-To: <20210209224556.Horde.RYCA-pbjVpbTsRo_x8_Msg8@messagerie.c-s.fr>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_08:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1034 phishscore=0 suspectscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100039
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

On Tue Feb 9, 2021 at 3:45 PM CST, Christophe Leroy wrote:
> "Christopher M. Riedl" <cmr@codefail.de> a =C3=A9crit :
>
> > Usually sigset_t is exactly 8B which is a "trivial" size and does not
> > warrant using __copy_from_user(). Use __get_user() directly in
> > anticipation of future work to remove the trivial size optimizations
> > from __copy_from_user(). Calling __get_user() also results in a small
> > boost to signal handling throughput here.
> >
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >  arch/powerpc/kernel/signal_64.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/signal_64.c =20
> > b/arch/powerpc/kernel/signal_64.c
> > index 817b64e1e409..42fdc4a7ff72 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -97,6 +97,14 @@ static void prepare_setup_sigcontext(struct =20
> > task_struct *tsk, int ctx_has_vsx_re
> >  #endif /* CONFIG_VSX */
> >  }
> >
> > +static inline int get_user_sigset(sigset_t *dst, const sigset_t *src)
>
> Should be called __get_user_sigset() as it is a helper for __get_user()

Ok makes sense.

>
> > +{
> > +	if (sizeof(sigset_t) <=3D 8)
>
> We should always use __get_user(), see below.
>
> > +		return __get_user(dst->sig[0], &src->sig[0]);
>
> I think the above will not work on ppc32, it will only copy 4 bytes.
> You must cast the source to u64*

Well this is signal_64.c :) Looks like ppc32 needs the same thing so
I'll just move this into signal.h and use it for both.=20

The only exception would be the COMPAT case in signal_32.c which ends up
calling the common get_compat_sigset(). Updating that is probably
outside the scope of this series.

>
> > +	else
> > +		return __copy_from_user(dst, src, sizeof(sigset_t));
>
> I see no point in keeping this alternative. Today sigset_ t is fixed.
> If you fear one day someone might change it to something different
> than a u64, just add a BUILD_BUG_ON(sizeof(sigset_t) !=3D sizeof(u64));

Ah yes that is much better - thanks for the suggestion.

>
> > +}
> > +
> >  /*
> >   * Set up the sigcontext for the signal frame.
> >   */
> > @@ -701,8 +709,9 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext =20
> > __user *, old_ctx,
> >  	 * We kill the task with a SIGSEGV in this situation.
> >  	 */
> >
> > -	if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
> > +	if (get_user_sigset(&set, &new_ctx->uc_sigmask))
> >  		do_exit(SIGSEGV);
> > +
>
> This white space is not part of the change, keep patches to the
> minimum, avoid cosmetic

Just a (bad?) habit on my part that I missed - I'll remove this one and
the one further below.

>
> >  	set_current_blocked(&set);
> >
> >  	if (!user_read_access_begin(new_ctx, ctx_size))
> > @@ -740,8 +749,9 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >  	if (!access_ok(uc, sizeof(*uc)))
> >  		goto badframe;
> >
> > -	if (__copy_from_user(&set, &uc->uc_sigmask, sizeof(set)))
> > +	if (get_user_sigset(&set, &uc->uc_sigmask))
> >  		goto badframe;
> > +
>
> Same
>
> >  	set_current_blocked(&set);
> >
> >  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > --
> > 2.26.1

