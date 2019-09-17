Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4BDB4520
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 03:06:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XQ1W3nDwzF3hT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 11:06:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XPyq6fPDzF3S5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 11:04:35 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H11kUY093369
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:04:32 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v0u13p5h8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:04:31 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 17 Sep 2019 02:04:29 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 02:04:27 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8H14QLX21561628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 01:04:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AAE711C054;
 Tue, 17 Sep 2019 01:04:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD17E11C05B;
 Tue, 17 Sep 2019 01:04:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 01:04:25 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (unknown [9.81.192.242])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E7B67A019A;
 Tue, 17 Sep 2019 11:04:23 +1000 (AEST)
Date: Tue, 17 Sep 2019 11:04:22 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 05/14] powerpc/eeh: Defer printing stack trace
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-6-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Content-Disposition: inline
In-Reply-To: <20190903101605.2890-6-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19091701-4275-0000-0000-0000036754F0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091701-4276-0000-0000-00003879B864
Message-Id: <20190917010421.GE21303@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170010
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


--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 08:15:56PM +1000, Oliver O'Halloran wrote:
> Currently we print a stack trace in the event handler to help with
> debugging EEH issues. In the case of suprise hot-unplug this is unneeded,
> so we want to prevent printing the stack trace unless we know it's due to
> an actual device error. To accomplish this, we can save a stack trace at
> the point of detection and only print it once the EEH recovery handler has
> determined the freeze was due to an actual error.
>=20
> Since the whole point of this is to prevent spurious EEH output we also
> move a few prints out of the detection thread, or mark them as pr_debug
> so anyone interested can get output from the eeh_check_dev_failure()
> if they want.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

I think this is a good change, and even in the normal case it will place
the stacktrace closer to the rest of the recovery information.

But, I think it would make more sense to put the stacktrace into the
struct eeh_event, rather than the struct eeh_pe. Is there some reason
we can't do that? (It would save a fair bit of memory!)

Cheers,
Sam.

> ---
>  arch/powerpc/include/asm/eeh.h   | 11 +++++++++
>  arch/powerpc/kernel/eeh.c        | 15 ++++---------
>  arch/powerpc/kernel/eeh_driver.c | 38 +++++++++++++++++++++++++++++++-
>  arch/powerpc/kernel/eeh_event.c  | 26 ++++++++++------------
>  4 files changed, 64 insertions(+), 26 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/ee=
h.h
> index c13119a5e69b..9d0e1694a94d 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -88,6 +88,17 @@ struct eeh_pe {
>  	struct list_head child_list;	/* List of PEs below this PE	*/
>  	struct list_head child;		/* Memb. child_list/eeh_phb_pe	*/
>  	struct list_head edevs;		/* List of eeh_dev in this PE	*/
> +
> +	/*
> +	 * Saved stack trace. When we find a PE freeze in eeh_dev_check_failure
> +	 * the stack trace is saved here so we can print it in the recovery
> +	 * thread if it turns out to due to a real problem rather than
> +	 * a hot-remove.
> +	 *
> +	 * A max of 64 entries might be overkill, but it also might not be.
> +	 */
> +	unsigned long stack_trace[64];
> +	int trace_entries;
>  };
> =20
>  #define eeh_pe_for_each_dev(pe, edev, tmp) \
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 9c468e79d13c..46d17817b438 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -420,11 +420,9 @@ static int eeh_phb_check_failure(struct eeh_pe *pe)
>  	eeh_pe_mark_isolated(phb_pe);
>  	eeh_serialize_unlock(flags);
> =20
> -	pr_err("EEH: PHB#%x failure detected, location: %s\n",
> +	pr_debug("EEH: PHB#%x failure detected, location: %s\n",
>  		phb_pe->phb->global_number, eeh_pe_loc_get(phb_pe));
> -	dump_stack();
>  	eeh_send_failure_event(phb_pe);
> -
>  	return 1;
>  out:
>  	eeh_serialize_unlock(flags);
> @@ -451,7 +449,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
>  	unsigned long flags;
>  	struct device_node *dn;
>  	struct pci_dev *dev;
> -	struct eeh_pe *pe, *parent_pe, *phb_pe;
> +	struct eeh_pe *pe, *parent_pe;
>  	int rc =3D 0;
>  	const char *location =3D NULL;
> =20
> @@ -581,13 +579,8 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
>  	 * a stack trace will help the device-driver authors figure
>  	 * out what happened.  So print that out.
>  	 */
> -	phb_pe =3D eeh_phb_pe_get(pe->phb);
> -	pr_err("EEH: Frozen PHB#%x-PE#%x detected\n",
> -	       pe->phb->global_number, pe->addr);
> -	pr_err("EEH: PE location: %s, PHB location: %s\n",
> -	       eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
> -	dump_stack();
> -
> +	pr_debug("EEH: %s: Frozen PHB#%x-PE#%x detected\n",
> +		__func__, pe->phb->global_number, pe->addr);
>  	eeh_send_failure_event(pe);
> =20
>  	return 1;
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_d=
river.c
> index 52ce7584af43..0d34cc12c529 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -863,8 +863,44 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  			if (eeh_slot_presence_check(edev->pdev))
>  				devices++;
> =20
> -	if (!devices)
> +	if (!devices) {
> +		pr_debug("EEH: Frozen PHB#%x-PE#%x is empty!\n",
> +			pe->phb->global_number, pe->addr);
>  		goto out; /* nothing to recover */
> +	}
> +
> +	/* Log the event */
> +	if (pe->type & EEH_PE_PHB) {
> +		pr_err("EEH: PHB#%x failure detected, location: %s\n",
> +			pe->phb->global_number, eeh_pe_loc_get(pe));
> +	} else {
> +		struct eeh_pe *phb_pe =3D eeh_phb_pe_get(pe->phb);
> +
> +		pr_err("EEH: Frozen PHB#%x-PE#%x detected\n",
> +		       pe->phb->global_number, pe->addr);
> +		pr_err("EEH: PE location: %s, PHB location: %s\n",
> +		       eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
> +	}
> +
> +	/*
> +	 * Print the saved stack trace now that we've verified there's
> +	 * something to recover.
> +	 */
> +	if (pe->trace_entries) {
> +		void **ptrs =3D (void **) pe->stack_trace;
> +		int i;
> +
> +		pr_err("EEH: Frozen PHB#%x-PE#%x detected\n",
> +		       pe->phb->global_number, pe->addr);
> +
> +		/* FIXME: Use the same format as dump_stack() */
> +		pr_err("EEH: Call Trace:\n");
> +		for (i =3D 0; i < pe->trace_entries; i++)
> +			pr_err("EEH: [%pK] %pS\n", ptrs[i], ptrs[i]);
> +
> +		pe->trace_entries =3D 0;
> +	}
> +
> =20
>  	eeh_pe_update_time_stamp(pe);
>  	pe->freeze_count++;
> diff --git a/arch/powerpc/kernel/eeh_event.c b/arch/powerpc/kernel/eeh_ev=
ent.c
> index e36653e5f76b..1d55486adb0f 100644
> --- a/arch/powerpc/kernel/eeh_event.c
> +++ b/arch/powerpc/kernel/eeh_event.c
> @@ -40,7 +40,6 @@ static int eeh_event_handler(void * dummy)
>  {
>  	unsigned long flags;
>  	struct eeh_event *event;
> -	struct eeh_pe *pe;
> =20
>  	while (!kthread_should_stop()) {
>  		if (wait_for_completion_interruptible(&eeh_eventlist_event))
> @@ -59,19 +58,10 @@ static int eeh_event_handler(void * dummy)
>  			continue;
> =20
>  		/* We might have event without binding PE */
> -		pe =3D event->pe;
> -		if (pe) {
> -			if (pe->type & EEH_PE_PHB)
> -				pr_info("EEH: Detected error on PHB#%x\n",
> -					 pe->phb->global_number);
> -			else
> -				pr_info("EEH: Detected PCI bus error on "
> -					"PHB#%x-PE#%x\n",
> -					pe->phb->global_number, pe->addr);
> -			eeh_handle_normal_event(pe);
> -		} else {
> +		if (event->pe)
> +			eeh_handle_normal_event(event->pe);
> +		else
>  			eeh_handle_special_event();
> -		}
> =20
>  		kfree(event);
>  	}
> @@ -126,8 +116,16 @@ int __eeh_send_failure_event(struct eeh_pe *pe)
>  	 * This prevents the PE from being free()ed by a hotplug driver
>  	 * while the PE is sitting in the event queue.
>  	 */
> -	if (pe)
> +	if (pe) {
> +		/*
> +		 * Save the current stack trace so we can dump it from the
> +		 * event handler thread.
> +		 */
> +		pe->trace_entries =3D stack_trace_save(pe->stack_trace,
> +					 ARRAY_SIZE(pe->stack_trace), 0);
> +
>  		eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
> +	}
> =20
>  	/* We may or may not be called in an interrupt context */
>  	spin_lock_irqsave(&eeh_eventlist_lock, flags);
> --=20
> 2.21.0
>=20

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2AMRUACgkQMX8w6AQl
/iLqzwf+Kmr+wdJS0Cm/x5EKAIdEoXhwJsmHLHqtscKlGdgyMn4ezKV/aYirqhDT
8y6N8A796xJRo8zjugHlfchaneqsdL2CwRwppG+eRi1zCIbURoYENAxepmYhHstn
FsGCsVOJpiNGVttYzAZ7eIpcizGtB6DafUtuj7+J48UaPEBQXpLRA2JJjcXa01FH
aQj3jqE1HfaDIQtRcorqfR9i2b99e/87Ov2El0pjzARc06o1INItzn/3CiIbVCWs
+Lzz/TGFq3UlauEN112lHs6nqVA/OKmTCwmXlRGtHHxYJbS9qY7CGsK2p0K42QRK
SDW0QuTvXZJCrRG1KJFanr7ic46Icg==
=/mx3
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--

