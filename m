Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3041044D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 21:17:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JDWk0PHCzDqKh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 07:17:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ljp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J7Fh4mfmzDqpv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 03:20:02 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKGE1mm035285; Wed, 20 Nov 2019 11:19:46 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wcf5ah7t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 11:19:45 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAKGEXve037774;
 Wed, 20 Nov 2019 11:19:45 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wcf5ah7sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 11:19:45 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAKGGDkp013679;
 Wed, 20 Nov 2019 16:19:44 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 2wa8r6yvd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 16:19:44 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAKGJhJL43712836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 16:19:43 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12447112061;
 Wed, 20 Nov 2019 16:19:43 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A26DB112062;
 Wed, 20 Nov 2019 16:19:41 +0000 (GMT)
Received: from [9.160.73.73] (unknown [9.160.73.73])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 20 Nov 2019 16:19:41 +0000 (GMT)
From: Lijun Pan <ljp@linux.vnet.ibm.com>
Message-Id: <CD112E07-53C1-4FD3-AD4D-69AA7A2CB5C5@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_BD508322-2206-492D-978B-D60761022886"
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2 1/2] KVM: PPC: Book3S HV: XIVE: Free previous EQ page
 when setting up a new one
Date: Wed, 20 Nov 2019 10:19:40 -0600
In-Reply-To: <157366357346.1026356.14522564753643067538.stgit@bahia.lan>
To: Greg Kurz <groug@kaod.org>
References: <157366357346.1026356.14522564753643067538.stgit@bahia.lan>
X-Mailer: Apple Mail (2.3601.0.10)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_04:2019-11-20,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=2
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911200142
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:16:03 +1100
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Lijun Pan <ljp@linux.ibm.com>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_BD508322-2206-492D-978B-D60761022886
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Nov 13, 2019, at 10:46 AM, Greg Kurz <groug@kaod.org> wrote:
>=20
> The EQ page is allocated by the guest and then passed to the =
hypervisor
> with the H_INT_SET_QUEUE_CONFIG hcall. A reference is taken on the =
page
> before handing it over to the HW. This reference is dropped either =
when
> the guest issues the H_INT_RESET hcall or when the KVM device is =
released.
> But, the guest can legitimately call H_INT_SET_QUEUE_CONFIG several =
times,
> either to reset the EQ (vCPU hot unplug) or to set a new EQ (guest =
reboot).
> In both cases the existing EQ page reference is leaked because we =
simply
> overwrite it in the XIVE queue structure without calling put_page().
>=20
> This is especially visible when the guest memory is backed with huge =
pages:
> start a VM up to the guest userspace, either reboot it or unplug a =
vCPU,
> quit QEMU. The leak is observed by comparing the value of =
HugePages_Free in
> /proc/meminfo before and after the VM is run.
>=20
> Ideally we'd want the XIVE code to handle the EQ page de-allocation at =
the
> platform level. This isn't the case right now because the various XIVE
> drivers have different allocation needs. It could maybe worth =
introducing
> hooks for this purpose instead of exposing XIVE internals to the =
drivers,
> but this is certainly a huge work to be done later.
>=20
> In the meantime, for easier backport, fix both vCPU unplug and guest =
reboot
> leaks by introducing a wrapper around xive_native_configure_queue() =
that
> does the necessary cleanup.
>=20
> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Cc: stable@vger.kernel.org # v5.2
> Fixes: 13ce3297c576 ("KVM: PPC: Book3S HV: XIVE: Add controls for the =
EQ configuration")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Greg Kurz <groug@kaod.org>

Tested-by: Lijun Pan <ljp@linux.ibm <mailto:ljp@linux.ibm>.com>

> ---
> v2: use wrapper as suggested by Cedric
> ---
> arch/powerpc/kvm/book3s_xive_native.c |   31 =
++++++++++++++++++++++---------
> 1 file changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c =
b/arch/powerpc/kvm/book3s_xive_native.c
> index 34bd123fa024..0e1fc5a16729 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -50,6 +50,24 @@ static void kvmppc_xive_native_cleanup_queue(struct =
kvm_vcpu *vcpu, int prio)
> 	}
> }
>=20
> +static int kvmppc_xive_native_configure_queue(u32 vp_id, struct =
xive_q *q,
> +					      u8 prio, __be32 *qpage,
> +					      u32 order, bool =
can_escalate)
> +{
> +	int rc;
> +	__be32 *qpage_prev =3D q->qpage;
> +
> +	rc =3D xive_native_configure_queue(vp_id, q, prio, qpage, order,
> +					 can_escalate);
> +	if (rc)
> +		return rc;
> +
> +	if (qpage_prev)
> +		put_page(virt_to_page(qpage_prev));
> +
> +	return rc;
> +}
> +
> void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu)
> {
> 	struct kvmppc_xive_vcpu *xc =3D vcpu->arch.xive_vcpu;
> @@ -575,19 +593,14 @@ static int =
kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
> 		q->guest_qaddr  =3D 0;
> 		q->guest_qshift =3D 0;
>=20
> -		rc =3D xive_native_configure_queue(xc->vp_id, q, =
priority,
> -						 NULL, 0, true);
> +		rc =3D kvmppc_xive_native_configure_queue(xc->vp_id, q, =
priority,
> +							NULL, 0, true);
> 		if (rc) {
> 			pr_err("Failed to reset queue %d for VCPU %d: =
%d\n",
> 			       priority, xc->server_num, rc);
> 			return rc;
> 		}
>=20
> -		if (q->qpage) {
> -			put_page(virt_to_page(q->qpage));
> -			q->qpage =3D NULL;
> -		}
> -
> 		return 0;
> 	}
>=20
> @@ -646,8 +659,8 @@ static int =
kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
> 	  * OPAL level because the use of END ESBs is not supported by
> 	  * Linux.
> 	  */
> -	rc =3D xive_native_configure_queue(xc->vp_id, q, priority,
> -					 (__be32 *) qaddr, =
kvm_eq.qshift, true);
> +	rc =3D kvmppc_xive_native_configure_queue(xc->vp_id, q, =
priority,
> +					(__be32 *) qaddr, kvm_eq.qshift, =
true);
> 	if (rc) {
> 		pr_err("Failed to configure queue %d for VCPU %d: %d\n",
> 		       priority, xc->server_num, rc);
>=20


--Apple-Mail=_BD508322-2206-492D-978B-D60761022886
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Nov 13, 2019, at 10:46 AM, Greg Kurz &lt;<a =
href=3D"mailto:groug@kaod.org" class=3D"">groug@kaod.org</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">The EQ page is allocated by the guest and then passed to the =
hypervisor<br class=3D"">with the H_INT_SET_QUEUE_CONFIG hcall. A =
reference is taken on the page<br class=3D"">before handing it over to =
the HW. This reference is dropped either when<br class=3D"">the guest =
issues the H_INT_RESET hcall or when the KVM device is released.<br =
class=3D"">But, the guest can legitimately call H_INT_SET_QUEUE_CONFIG =
several times,<br class=3D"">either to reset the EQ (vCPU hot unplug) or =
to set a new EQ (guest reboot).<br class=3D"">In both cases the existing =
EQ page reference is leaked because we simply<br class=3D"">overwrite it =
in the XIVE queue structure without calling put_page().<br class=3D""><br =
class=3D"">This is especially visible when the guest memory is backed =
with huge pages:<br class=3D"">start a VM up to the guest userspace, =
either reboot it or unplug a vCPU,<br class=3D"">quit QEMU. The leak is =
observed by comparing the value of HugePages_Free in<br =
class=3D"">/proc/meminfo before and after the VM is run.<br class=3D""><br=
 class=3D"">Ideally we'd want the XIVE code to handle the EQ page =
de-allocation at the<br class=3D"">platform level. This isn't the case =
right now because the various XIVE<br class=3D"">drivers have different =
allocation needs. It could maybe worth introducing<br class=3D"">hooks =
for this purpose instead of exposing XIVE internals to the drivers,<br =
class=3D"">but this is certainly a huge work to be done later.<br =
class=3D""><br class=3D"">In the meantime, for easier backport, fix both =
vCPU unplug and guest reboot<br class=3D"">leaks by introducing a =
wrapper around xive_native_configure_queue() that<br class=3D"">does the =
necessary cleanup.<br class=3D""><br class=3D"">Reported-by: Satheesh =
Rajendran &lt;<a href=3D"mailto:sathnaga@linux.vnet.ibm.com" =
class=3D"">sathnaga@linux.vnet.ibm.com</a>&gt;<br class=3D"">Cc: <a =
href=3D"mailto:stable@vger.kernel.org" =
class=3D"">stable@vger.kernel.org</a> # v5.2<br class=3D"">Fixes: =
13ce3297c576 ("KVM: PPC: Book3S HV: XIVE: Add controls for the EQ =
configuration")<br class=3D"">Signed-off-by: C=C3=A9dric Le Goater =
&lt;<a href=3D"mailto:clg@kaod.org" class=3D"">clg@kaod.org</a>&gt;<br =
class=3D"">Signed-off-by: Greg Kurz &lt;<a href=3D"mailto:groug@kaod.org" =
class=3D"">groug@kaod.org</a>&gt;<br =
class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>Tested-by: Lijun Pan &lt;<a =
href=3D"mailto:ljp@linux.ibm" =
class=3D"">ljp@linux.ibm</a>.com&gt;</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D"">---<br =
class=3D"">v2: use wrapper as suggested by Cedric<br class=3D"">---<br =
class=3D""> arch/powerpc/kvm/book3s_xive_native.c | &nbsp;&nbsp;31 =
++++++++++++++++++++++---------<br class=3D""> 1 file changed, 22 =
insertions(+), 9 deletions(-)<br class=3D""><br class=3D"">diff --git =
a/arch/powerpc/kvm/book3s_xive_native.c =
b/arch/powerpc/kvm/book3s_xive_native.c<br class=3D"">index =
34bd123fa024..0e1fc5a16729 100644<br class=3D"">--- =
a/arch/powerpc/kvm/book3s_xive_native.c<br class=3D"">+++ =
b/arch/powerpc/kvm/book3s_xive_native.c<br class=3D"">@@ -50,6 +50,24 @@ =
static void kvmppc_xive_native_cleanup_queue(struct kvm_vcpu *vcpu, int =
prio)<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D""> }<br =
class=3D""><br class=3D"">+static int =
kvmppc_xive_native_configure_queue(u32 vp_id, struct xive_q *q,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u8 prio, __be32 *qpage,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u32 order, bool can_escalate)<br =
class=3D"">+{<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>int rc;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>__be32 =
*qpage_prev =3D q-&gt;qpage;<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rc =3D =
xive_native_configure_queue(vp_id, q, prio, qpage, order,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> can_escalate);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (rc)<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
rc;<br class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (qpage_prev)<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>put_page(virt_to_page(qpage_prev));<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return rc;<br class=3D"">+}<br class=3D"">+<br class=3D""> void =
kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu)<br class=3D""> =
{<br class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>struct kvmppc_xive_vcpu *xc =3D =
vcpu-&gt;arch.xive_vcpu;<br class=3D"">@@ -575,19 +593,14 @@ static int =
kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>q-&gt;guest_qaddr &nbsp;=3D 0;<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>q-&gt;guest_qshift =3D 0;<br class=3D""><br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rc =3D =
xive_native_configure_queue(xc-&gt;vp_id, q, priority,<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> NULL, 0, true);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>rc =3D =
kvmppc_xive_native_configure_queue(xc-&gt;vp_id, q, priority,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>NULL, 0, true);<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (rc) {<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>pr_err("Failed to reset queue %d for VCPU %d: %d\n",<br class=3D"">=
 <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;priority, xc-&gt;server_num, =
rc);<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return rc;<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D""><br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (q-&gt;qpage) {<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>put_page(virt_to_page(q-&gt;qpage));<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>q-&gt;qpage =3D NULL;<br class=3D"">-<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">-<br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return 0;<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D""><br class=3D"">@@ =
-646,8 +659,8 @@ static int kvmppc_xive_native_set_queue_config(struct =
kvmppc_xive *xive,<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> &nbsp;* OPAL level because the =
use of END ESBs is not supported by<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> &nbsp;* =
Linux.<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> &nbsp;*/<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rc =3D =
xive_native_configure_queue(xc-&gt;vp_id, q, priority,<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> (__be32 *) qaddr, kvm_eq.qshift, true);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rc =3D =
kvmppc_xive_native_configure_queue(xc-&gt;vp_id, q, priority,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>(__be32 *) qaddr, kvm_eq.qshift, true);<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (rc) =
{<br class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>pr_err("Failed to configure queue %d for VCPU %d: %d\n",<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;priority, xc-&gt;server_num, =
rc);<br class=3D""><br class=3D""></div></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_BD508322-2206-492D-978B-D60761022886--

