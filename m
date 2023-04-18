Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 430476E5975
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 08:32:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0vGw1lM0z3fWC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 16:32:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0vGL0KLMz3ccw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 16:31:54 +1000 (AEST)
Received: from [2601:447:c680:c050::4033]
	by baldur.buserror.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <oss@buserror.net>)
	id 1poeqP-00AZE6-WD; Tue, 18 Apr 2023 01:29:38 -0500
Message-ID: <497c92b50103a4ba3469cd41edbd967ee9bfb291.camel@buserror.net>
From: Crystal Wood <oss@buserror.net>
To: Sean Anderson <sean.anderson@seco.com>, Li Yang <leoyang.li@nxp.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 18 Apr 2023 01:29:36 -0500
In-Reply-To: <3b707d1c-1120-274f-6cd6-b3283a334563@seco.com>
References: <20230404145557.2356894-1-sean.anderson@seco.com>
	 <20230404145557.2356894-2-sean.anderson@seco.com>
	 <48dacc58c7c04ba8a005d8edd56744c8455f007e.camel@buserror.net>
	 <d4737c45-2bbf-d364-9768-20baa46f6af4@seco.com>
	 <3b707d1c-1120-274f-6cd6-b3283a334563@seco.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2601:447:c680:c050::4033
X-SA-Exim-Rcpt-To: sean.anderson@seco.com, leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, camelia.groza@nxp.com, linux-kernel@vger.kernel.org, roy.pledge@nxp.com, davem@davemloft.net, madalin.bucur@nxp.com
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Report: 	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: Re: [PATCH v3 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: Madalin Bucur <madalin.bucur@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, "David S .
	Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-04-11 at 11:09 -0400, Sean Anderson wrote:
> Hi Crystal,
>=20
> On 4/4/23 12:04, Sean Anderson wrote:
> > On 4/4/23 11:33, Crystal Wood wrote:
> > > On Tue, 2023-04-04 at 10:55 -0400, Sean Anderson wrote:
> > >=20
> > > > @@ -1456,11 +1456,11 @@ static void tqm_congestion_task(struct
> > > > work_struct
> > > > *work)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0union qm_mc_result =
*mcr;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct qman_cgr *cg=
r;
> > > > =C2=A0
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irq(&p->cgr_lo=
ck);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0raw_spin_lock_irq(&p->cg=
r_lock);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qm_mc_start(&p->p);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qm_mc_commit(&p->p,=
 QM_MCC_VERB_QUERYCONGESTION);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!qm_mc_result_t=
imeout(&p->p, &mcr)) {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock_irq(&p->cgr_lock);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0raw_spin_unlock_irq(&p->cgr_lock);
> > >=20
> > > qm_mc_result_timeout() spins with a timeout of 10 ms which is very
> > > inappropriate for a raw lock.=C2=A0 What is the actual expected upper=
 bound?
> >=20
> > Hm, maybe we can move this qm_mc stuff outside cgr_lock? In most other
> > places they're called without cgr_lock, which implies that its usage
> > here is meant to synchronize against some other function.
>=20
> Do you have any suggestions here? I think this should really be handled
> in a follow-up patch. If you think this code is waiting too long in a raw
> spinlock, the existing code can wait just as long with IRQs disabled.
> This patch doesn't change existing system responsiveness.

Well, AFAICT it expands the situations in which it happens from configurati=
on
codepaths to stuff like congestion handling.  The proper fix would probably=
 be
to use some mechanism other than smp_call_function_single() to run code on =
the
target cpu so that it can run with irqs enabled (or get confirmation that t=
he
actual worst case is short enough), but barring that I guess at least
acknowledge the situation in a comment?

-Crystal

