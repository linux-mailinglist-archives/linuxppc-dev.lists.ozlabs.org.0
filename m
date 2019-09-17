Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66059B44EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 02:45:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XPXx5ckpzF3YV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 10:45:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XPW30yFgzF34F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 10:43:54 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H0fxWi075943
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 20:43:49 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2h81pxgt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 20:43:49 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 17 Sep 2019 01:43:47 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 01:43:45 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H0hirR50987122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 00:43:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6D8CA404D;
 Tue, 17 Sep 2019 00:43:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 116E8A4040;
 Tue, 17 Sep 2019 00:43:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 00:43:44 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (unknown [9.81.192.242])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7A0EAA019A;
 Tue, 17 Sep 2019 10:43:40 +1000 (AEST)
Date: Tue, 17 Sep 2019 10:43:39 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 01/14] powerpc/eeh: Clean up EEH PEs after recovery
 finishes
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-2-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20190903101605.2890-2-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19091700-4275-0000-0000-000003675276
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091700-4276-0000-0000-00003879B5E5
Message-Id: <20190917004338.GA21303@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170006
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


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 08:15:52PM +1000, Oliver O'Halloran wrote:
> When the last device in an eeh_pe is removed the eeh_pe structure itself
> (and any empty parents) are freed since they are no longer needed. This
> results in a crash when a hotplug driver is involved since the following
> may occur:
>=20
> 1. Device is suprise removed.
> 2. Driver performs an MMIO, which fails and queues and eeh_event.
> 3. Hotplug driver receives a hotplug interrupt and removes any
>    pci_devs that were under the slot.
> 4. pci_dev is torn down and the eeh_pe is freed.
> 5. The EEH event handler thread processes the eeh_event and crashes
>    since the eeh_pe pointer in the eeh_event structure is no
>    longer valid.
>=20
> Crashing is generally considered poor form. Instead of doing that use
> the fact PEs are marked as EEH_PE_INVALID to keep them around until the
> end of the recovery cycle, at which point we can safely prune any empty
> PEs.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

I think this could use a bit more explanation about how the change
correct the problem, but if I understand it correctly, what it's doing
is (for the hotplug problem case):
- When the (problmatic) freeeze is detected during hot unplug, change
  eeh_dev_checK_failure() so that it marks PEs with EEH_PE_RECOVERING
  immediately rather than waiting until error recovery has started.
- Then as the hot unplug continues and the device is removed, and
  eeh_rmv_from_parent_pe() is called, change it so that it does not
  remove PEs that are marked EEH_PE_RECOVERING (which will be the ones
  just marked).
- Then as recovery starts, PE removal won't race between the hotplug
  code and the recovery code, and the crash is avoided.

If that's right, it looks fine to me, although as you said we might want
to revert it if/when we have something better.

I haven't got a test setup for the error case, but I've tried my usual
test cases and they all seem to be OK. The only place I can see that
might be disturbed by this change is where EEH_PE_RECOVERING affects
eeh_pe_reset_and_recover() (used when a PE is passed back from
a guest to the host), but the test case doesn't seem to be any worse.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
> Sam Bobroff is working on implementing proper refcounting for EEH PEs,
> but that's not going to be ready for a while and this is less broken
> than what we have now.
> ---
>  arch/powerpc/kernel/eeh_driver.c | 36 ++++++++++++++++++++++++++++++--
>  arch/powerpc/kernel/eeh_event.c  |  8 +++++++
>  arch/powerpc/kernel/eeh_pe.c     | 23 +++++++++++++++++++-
>  3 files changed, 64 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_d=
river.c
> index a31cd32c4ce9..75266156943f 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -734,6 +734,33 @@ static int eeh_reset_device(struct eeh_pe *pe, struc=
t pci_bus *bus,
>   */
>  #define MAX_WAIT_FOR_RECOVERY 300
> =20
> +
> +/* Walks the PE tree after processing an event to remove any stale PEs.
> + *
> + * NB: This needs to be recursive to ensure the leaf PEs get removed
> + * before their parents do. Although this is possible to do recursively
> + * we don't since this is easier to read and we need to garantee
> + * the leaf nodes will be handled first.
> + */
> +static void eeh_pe_cleanup(struct eeh_pe *pe)
> +{
> +	struct eeh_pe *child_pe, *tmp;
> +
> +	list_for_each_entry_safe(child_pe, tmp, &pe->child_list, child)
> +		eeh_pe_cleanup(child_pe);
> +
> +	if (pe->state & EEH_PE_KEEP)
> +		return;
> +
> +	if (!(pe->state & EEH_PE_INVALID))
> +		return;
> +
> +	if (list_empty(&pe->edevs) && list_empty(&pe->child_list)) {
> +		list_del(&pe->child);
> +		kfree(pe);
> +	}
> +}
> +
>  /**
>   * eeh_handle_normal_event - Handle EEH events on a specific PE
>   * @pe: EEH PE - which should not be used after we return, as it may
> @@ -772,8 +799,6 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  		return;
>  	}
> =20
> -	eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
> -
>  	eeh_pe_update_time_stamp(pe);
>  	pe->freeze_count++;
>  	if (pe->freeze_count > eeh_max_freezes) {
> @@ -963,6 +988,12 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  			return;
>  		}
>  	}
> +
> +	/*
> +	 * Clean up any PEs without devices. While marked as EEH_PE_RECOVERYING
> +	 * we don't want to modify the PE tree structure so we do it here.
> +	 */
> +	eeh_pe_cleanup(pe);
>  	eeh_pe_state_clear(pe, EEH_PE_RECOVERING, true);
>  }
> =20
> @@ -1035,6 +1066,7 @@ void eeh_handle_special_event(void)
>  		 */
>  		if (rc =3D=3D EEH_NEXT_ERR_FROZEN_PE ||
>  		    rc =3D=3D EEH_NEXT_ERR_FENCED_PHB) {
> +			eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
>  			eeh_handle_normal_event(pe);
>  		} else {
>  			pci_lock_rescan_remove();
> diff --git a/arch/powerpc/kernel/eeh_event.c b/arch/powerpc/kernel/eeh_ev=
ent.c
> index 64cfbe41174b..e36653e5f76b 100644
> --- a/arch/powerpc/kernel/eeh_event.c
> +++ b/arch/powerpc/kernel/eeh_event.c
> @@ -121,6 +121,14 @@ int __eeh_send_failure_event(struct eeh_pe *pe)
>  	}
>  	event->pe =3D pe;
> =20
> +	/*
> +	 * Mark the PE as recovering before inserting it in the queue.
> +	 * This prevents the PE from being free()ed by a hotplug driver
> +	 * while the PE is sitting in the event queue.
> +	 */
> +	if (pe)
> +		eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
> +
>  	/* We may or may not be called in an interrupt context */
>  	spin_lock_irqsave(&eeh_eventlist_lock, flags);
>  	list_add(&event->list, &eeh_eventlist);
> diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
> index 1a6254bcf056..177852e39a25 100644
> --- a/arch/powerpc/kernel/eeh_pe.c
> +++ b/arch/powerpc/kernel/eeh_pe.c
> @@ -470,6 +470,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
>  int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
>  {
>  	struct eeh_pe *pe, *parent, *child;
> +	bool keep, recover;
>  	int cnt;
> =20
>  	pe =3D eeh_dev_to_pe(edev);
> @@ -490,10 +491,21 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
>  	 */
>  	while (1) {
>  		parent =3D pe->parent;
> +
> +		/* PHB PEs should never be removed */
>  		if (pe->type & EEH_PE_PHB)
>  			break;
> =20
> -		if (!(pe->state & EEH_PE_KEEP)) {
> +		/*
> +		 * XXX: KEEP is set while resetting a PE. I don't think it's
> +		 * ever set without RECOVERING also being set. I could
> +		 * be wrong though so catch that with a WARN.
> +		 */
> +		keep =3D !!(pe->state & EEH_PE_KEEP);
> +		recover =3D !!(pe->state & EEH_PE_RECOVERING);
> +		WARN_ON(keep && !recover);
> +
> +		if (!keep && !recover) {
>  			if (list_empty(&pe->edevs) &&
>  			    list_empty(&pe->child_list)) {
>  				list_del(&pe->child);
> @@ -502,6 +514,15 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
>  				break;
>  			}
>  		} else {
> +			/*
> +			 * Mark the PE as invalid. At the end of the recovery
> +			 * process any invalid PEs will be garbage collected.
> +			 *
> +			 * We need to delay the free()ing of them since we can
> +			 * remove edev's while traversing the PE tree which
> +			 * might trigger the removal of a PE and we can't
> +			 * deal with that (yet).
> +			 */
>  			if (list_empty(&pe->edevs)) {
>  				cnt =3D 0;
>  				list_for_each_entry(child, &pe->child_list, child) {
> --=20
> 2.21.0
>=20

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2ALDIACgkQMX8w6AQl
/iKMCAf8DkBASWWYu3tES8zDR8TK9Lnx++S41nHF/XlXEowRbeo3FSxFu9ERXpN6
pI4aUKeX+GXq6ursq0pXWGZIZ7jI8NV7IEOV60aZaHlf49WFfkt253Dcwgm1KmPu
FdkTE7HReSPlOJqfLksoYLp/F9WKJ1LzPWEO/NLGe7M9BHGSNUkggsmfWPzjjZED
WbGxxoGOAHS6R8txFXY5GhYmrg3uxeW+4YMBDbaFOe0FnsQojRKdLZHG9ZaFTJmS
WQZcAA5cmu+bC13W16VVFiStXvf8cVvCjam8WtL6HWN7SGJlA6igH+AvFB5RnG/Z
Qaa6N5axf4jtbeN7uVjVA9CWWGpcMA==
=x1gN
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--

