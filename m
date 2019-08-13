Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6678AD65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 06:15:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466zsS2qwpzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 14:15:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466zLZ1xwvzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 13:52:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 466zLZ13dfz8tWN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 13:52:22 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 466zLZ04dDz9sPf; Tue, 13 Aug 2019 13:52:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ljp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 466zLY375Rz9sNF
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 13:52:20 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7D3pkFu071061
 for <linuxppc-dev@ozlabs.org>; Mon, 12 Aug 2019 23:52:16 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ubk50mrm0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 12 Aug 2019 23:52:16 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <ljp@linux.vnet.ibm.com>;
 Tue, 13 Aug 2019 04:52:15 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 13 Aug 2019 04:52:13 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7D3qCjl53150072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Aug 2019 03:52:12 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32DF8124054;
 Tue, 13 Aug 2019 03:52:12 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2E95124052;
 Tue, 13 Aug 2019 03:52:11 +0000 (GMT)
Received: from [9.85.130.107] (unknown [9.85.130.107])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Aug 2019 03:52:11 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 2/2] powerpc/xive: Implement get_irqchip_state method for
 XIVE to fix shutdown race
From: Lijun Pan <ljp@linux.vnet.ibm.com>
In-Reply-To: <20190812050743.aczgcqwmtqpkbx2l@oak.ozlabs.ibm.com>
Date: Mon, 12 Aug 2019 22:52:11 -0500
Content-Transfer-Encoding: quoted-printable
References: <20190812050623.ltla46gh5futsqv4@oak.ozlabs.ibm.com>
 <20190812050743.aczgcqwmtqpkbx2l@oak.ozlabs.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19081303-0060-0000-0000-0000036C168C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011587; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01246035; UDB=6.00657517; IPR=6.01027540; 
 MB=3.00028155; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-13 03:52:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081303-0061-0000-0000-00004A8823C7
Message-Id: <E547965E-CC31-470F-8849-0F2A899A121F@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=913 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130040
X-Mailman-Approved-At: Tue, 13 Aug 2019 14:14:04 +1000
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
Cc: linuxppc-dev@ozlabs.org, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Aug 12, 2019, at 12:07 AM, Paul Mackerras <paulus@ozlabs.org> =
wrote:
>=20
> ---
> arch/powerpc/include/asm/xive.h   |  8 ++++
> arch/powerpc/kvm/book3s_xive.c    | 31 ++++++++++++++
> arch/powerpc/sysdev/xive/common.c | 87 =
++++++++++++++++++++++++++++-----------
> 3 files changed, 103 insertions(+), 23 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/xive.h =
b/arch/powerpc/include/asm/xive.h
> index e4016985764e..efb0e597b272 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -46,7 +46,15 @@ struct xive_irq_data {
>=20
> 	/* Setup/used by frontend */
> 	int target;
> +	/*
> +	 * saved_p means that there is a queue entry for this interrupt
> +	 * in some CPU's queue (not including guest vcpu queues), even
> +	 * if P is not set in the source ESB.
> +	 * stale_p means that there is no queue entry for this interrupt
> +	 * in some CPU's queue, even if P is set in the source ESB.
> +	 */
> 	bool saved_p;
> +	bool stale_p;
> };
> #define XIVE_IRQ_FLAG_STORE_EOI	0x01
> #define XIVE_IRQ_FLAG_LSI	0x02
> diff --git a/arch/powerpc/kvm/book3s_xive.c =
b/arch/powerpc/kvm/book3s_xive.c
> index 09f838aa3138..74eea009c095 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -160,6 +160,9 @@ static irqreturn_t xive_esc_irq(int irq, void =
*data)
> 	 */
> 	vcpu->arch.xive_esc_on =3D false;
>=20
> +	/* This orders xive_esc_on =3D false vs. subsequent stale_p =3D =
true */
> +	smp_wmb();	/* goes with smp_mb() in =
cleanup_single_escalation */
> +
> 	return IRQ_HANDLED;
> }
>=20
> @@ -1113,6 +1116,31 @@ void kvmppc_xive_disable_vcpu_interrupts(struct =
kvm_vcpu *vcpu)
> 	vcpu->arch.xive_esc_raddr =3D 0;
> }
>=20
> +/*
> + * In single escalation mode, the escalation interrupt is marked so
> + * that EOI doesn't re-enable it, but just sets the stale_p flag to
> + * indicate that the P bit has already been dealt with.  However, the
> + * assembly code that enters the guest sets PQ to 00 without clearing
> + * stale_p (because it has no easy way to address it).  Hence we have
> + * to adjust stale_p before shutting down the interrupt.
> + */
> +static void cleanup_single_escalation(struct kvm_vcpu *vcpu,
> +				      struct kvmppc_xive_vcpu *xc, int =
irq)
> +{
> +	struct irq_data *d =3D irq_get_irq_data(irq);
> +	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
> +
> +	/*
> +	 * This slightly odd sequence gives the right result
> +	 * (i.e. stale_p set if xive_esc_on is false) even if
> +	 * we race with xive_esc_irq() and xive_irq_eoi().
> +	 */

Hi Paul,

I don=E2=80=99t quite understand the logic here.
Are you saying the code sequence is
vcpu->arch.xive_esc_on =3D false; (xive_esc_irq)
then
xd->stale_p =3D true; (cleanup_single_escaltion)

> +	xd->stale_p =3D false;
> +	smp_mb();		/* paired with smb_wmb in xive_esc_irq =
*/
> +	if (!vcpu->arch.xive_esc_on)
> +		xd->stale_p =3D true;
> +}
> +
> void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu *vcpu)
> {
> 	struct kvmppc_xive_vcpu *xc =3D vcpu->arch.xive_vcpu;
> @@ -1137,6 +1165,9 @@ void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu =
*vcpu)
> 	/* Free escalations */
> 	for (i =3D 0; i < KVMPPC_XIVE_Q_COUNT; i++) {
> 		if (xc->esc_virq[i]) {
> +			if (xc->xive->single_escalation)
> +				cleanup_single_escalation(vcpu, xc,
> +							  =
xc->esc_virq[i]);
> 			free_irq(xc->esc_virq[i], vcpu);
> 			irq_dispose_mapping(xc->esc_virq[i]);
> 			kfree(xc->esc_virq_names[i]);
> diff --git a/arch/powerpc/sysdev/xive/common.c =
b/arch/powerpc/sysdev/xive/common.c
> index 1cdb39575eae..be86fce1a84e 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -135,7 +135,7 @@ static u32 xive_read_eq(struct xive_q *q, bool =
just_peek)
> static u32 xive_scan_interrupts(struct xive_cpu *xc, bool just_peek)
> {
> 	u32 irq =3D 0;
> -	u8 prio;
> +	u8 prio =3D 0;
>=20
> 	/* Find highest pending priority */
> 	while (xc->pending_prio !=3D 0) {
> @@ -148,8 +148,19 @@ static u32 xive_scan_interrupts(struct xive_cpu =
*xc, bool just_peek)
> 		irq =3D xive_read_eq(&xc->queue[prio], just_peek);
>=20
> 		/* Found something ? That's it */
> -		if (irq)
> -			break;
> +		if (irq) {
> +			if (just_peek || irq_to_desc(irq))
> +				break;
> +			/*
> +			 * We should never get here; if we do then we =
must
> +			 * have failed to synchronize the interrupt =
properly
> +			 * when shutting it down.
> +			 */
> +			pr_crit("xive: got interrupt %d without =
descriptor, dropping\n",
> +				irq);
> +			WARN_ON(1);
> +			continue;
> +		}
>=20
> 		/* Clear pending bits */
> 		xc->pending_prio &=3D ~(1 << prio);
> @@ -307,6 +318,7 @@ static void xive_do_queue_eoi(struct xive_cpu *xc)
>  */
> static void xive_do_source_eoi(u32 hw_irq, struct xive_irq_data *xd)
> {
> +	xd->stale_p =3D false;
> 	/* If the XIVE supports the new "store EOI facility, use it */
> 	if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
> 		xive_esb_write(xd, XIVE_ESB_STORE_EOI, 0);
> @@ -350,7 +362,7 @@ static void xive_do_source_eoi(u32 hw_irq, struct =
xive_irq_data *xd)
> 	}
> }
>=20
> -/* irq_chip eoi callback */
> +/* irq_chip eoi callback, called with irq descriptor lock held */
> static void xive_irq_eoi(struct irq_data *d)
> {
> 	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
> @@ -366,6 +378,8 @@ static void xive_irq_eoi(struct irq_data *d)
> 	if (!irqd_irq_disabled(d) && !irqd_is_forwarded_to_vcpu(d) &&
> 	    !(xd->flags & XIVE_IRQ_NO_EOI))
> 		xive_do_source_eoi(irqd_to_hwirq(d), xd);
> +	else
> +		xd->stale_p =3D true;
>=20
> 	/*
> 	 * Clear saved_p to indicate that it's no longer occupying
> @@ -397,11 +411,16 @@ static void xive_do_source_set_mask(struct =
xive_irq_data *xd,
> 	 */
> 	if (mask) {
> 		val =3D xive_esb_read(xd, XIVE_ESB_SET_PQ_01);
> -		xd->saved_p =3D !!(val & XIVE_ESB_VAL_P);
> -	} else if (xd->saved_p)
> +		if (!xd->stale_p && !!(val & XIVE_ESB_VAL_P))
> +			xd->saved_p =3D true;
> +		xd->stale_p =3D false;
> +	} else if (xd->saved_p) {
> 		xive_esb_read(xd, XIVE_ESB_SET_PQ_10);
> -	else
> +		xd->saved_p =3D false;

Should we also explicitly set xd->stale_p =3D true; here?

> +	} else {
> 		xive_esb_read(xd, XIVE_ESB_SET_PQ_00);
> +		xd->stale_p =3D false;

Should we also explicitly set xd->saved_p =3D true; here?

Thanks,
Lijun

