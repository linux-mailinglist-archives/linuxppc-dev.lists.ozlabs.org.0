Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7E20CD2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 10:13:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wKxQ5f1hzDqNy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 18:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FAcvVXK/; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wKvb2wc0zDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 18:11:38 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id b6so15536425wrs.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=MsyOug1zdvZ7RhqVcjIp2iACjFkfk1iI7+Y6+Z0p3Wo=;
 b=FAcvVXK/7FyTj5u7BKWPMbbUJcp/he1eqAP5X/t8UQM5RLNpFBXGhz56VZNQIapStn
 +Esq5e5VwBuEkJ+khthTYFfl0xFOCExVAWXXDmhf5RsbObu5PU6XckeHe2/flAN/BCrp
 sVtEXqfZrz0N32WRA21vrRQ3Jgd5iBhn9+H0FlobSo8mm+yhtCEa8eNWNhycmYfDhg9w
 yAQ6rDstVte0VGC0UH0dngXAbXm3McyuhWRWUAIG6T55UdBBpfjnsH1jCHdIiprhT6H3
 z3DlzVPQYN4CArksdImwpFntjb0cz5kpHxwvKWBFXXNvzBM+HfHeu45mCFN4+TIssGbx
 hDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=MsyOug1zdvZ7RhqVcjIp2iACjFkfk1iI7+Y6+Z0p3Wo=;
 b=j8i+O2lkCSAQfe4E0ikbdemnTopPLGeKfEQhqpS5Twxbzz70Bl/Xrmu0gggtbRfF6y
 TkmZMLVjSXAneHYnHJ4ndY7fQctmw43sB5EN7Skp8RrBkZC+xxpeaABk8N/L1dnEYGWL
 CJFWnQZmfPsYjZQFAPPht9GNxfCzfCJzA7YwBJRN6OS9YqU8jWcbFFzJKHbKh22SVGYN
 No6mNeAd3Tp+wUXShWjKX5sejaf6hInOAk/X19XpuvKpLMiVYRyqsOxJJiTqXmuk9iNi
 qeIo6sJ5ZQau3oWhSqLopbtyFva8/jkOoOx2T6+bJSnoixrkyBw2mUU8W83pDW6lcwq6
 av5w==
X-Gm-Message-State: AOAM531U0osM8cZ53MgYtjrF+9XqOvX0ikDdyDgnBuiRRgpS2K29xL37
 tKpOw7a3QMnagNKlmmNJliY=
X-Google-Smtp-Source: ABdhPJw2u/Bl4pHRE1LLRF40h1mTMkfEy46AGpaQvHUQ85je78+PAAu//qZjfhCb+KnOKMlbAPb01Q==
X-Received: by 2002:adf:eecf:: with SMTP id a15mr15888750wrp.83.1593418293765; 
 Mon, 29 Jun 2020 01:11:33 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([61.69.149.112])
 by smtp.googlemail.com with ESMTPSA id 26sm25470487wmj.25.2020.06.29.01.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:11:33 -0700 (PDT)
Message-ID: <d591c24c2a469cb8ddc0c52e0cad93f347e1008b.camel@gmail.com>
Subject: Re: [PATCH RFC 1/1] powerpc/eeh: Synchronization for safety
From: Oliver O'Halloran <oohall@gmail.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 29 Jun 2020 18:11:27 +1000
In-Reply-To: <049418257caa232ca3e27ee8cbab9b4ff38b11aa.1585550388.git.sbobroff@linux.ibm.com>
References: <049418257caa232ca3e27ee8cbab9b4ff38b11aa.1585550388.git.sbobroff@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-30 at 17:39 +1100, Sam Bobroff wrote:
> There is currently little synchronization between EEH error detection
> (eeh_dev_check_failure()), EEH error recovery
> (eeh_handle_{normal,special}_event()) and the PCI subsystem (device
> addition and removal), and so there are race conditions that lead to
> crashes (often access to free'd memory or LIST_POISON).
> 
> However, a solution must consider:
> - EEH error detection can occur in interrupt context, which prevents
> the use of a mutex.
> - EEH recovery may need to sleep, which prevents the use of a spinlock.
> - EEH recovery uses PCI operations that may require the PCI
> rescan/remove lock and/or device lock to be held
> - PCI operations may hold the rescan/remove and/or device lock when
> calling into EEH functions.
> - Device driver callbacks may perform arbitrary PCI operations
> during recovery, including device removal.
> 
> In this patch the existing mutex and spinlock are combined with the
> EEH_PE_RECOVERING flag to provide some assurances that are then used
> to reduce the race conditions.

> The fields to be protected are the ones that provide the structure
> of the trees of struct eeh_pe that are held for each PHB: the parent
> pointer and child lists and the list of struct eeh_dev, as well as
> the pe and pdev pointers within struct eeh_dev.

This needs to be explicitly documented in the source tree. Preferably
next to the fields they protect in eeh_pe and eeh_dev.


> - I'm not aware of any outstanding problems with the set, but I've kept it RFC
>   for now becuase I'm looking for comments on the general strategy and
>   direction -- is this a good way to achieve some safety?

The two-locks idea seems like the sort of thing that's easy to screw up
and it's not really obvious what it's doing or why. Half the problem
with EEH is that it doesn't really make sense unless you spend far too
much time gazing into that abyss and this isn't really improving
matters IMO.

The main driver seems to be the desire to dereference edev->pe from
eeh_dev_check_failure(), but... why? The way it works is technically
broken as-is since it relies on eeh_ops->get_state() correctly
reporting the PE state. That's the same function that we have that 300s
wait hack for in the recovery thread (makes you wonder what platforms
actually need that...)

We've spoken in the past about having eeh_dev_check_failure() punt the
work of checking PE states into the event handler thread. I think we'd
get more milage out of that idea rather than doing the two-locks thing.
Is there some other situation besides eeh_dev_check_failure() being
called from interrupt context that makes the spinlock necessary?


> - Good places to review carefully would be eeh_pe_report_pdev() and
>   eeh_reset_device().

> - The mutex and spinlock need better names. Suggestions welcome.

eeh_dev_mutex should just be eeh_pe_tree_mutex, or similar. If you
really think the two locks idea is the way to go then
eeh_pe_tree_spinlock would make sense too. If we're going to have two
locks covering the same things then their names should be similar.

> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 12c248a16527..30acae0d10e5 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -108,11 +108,26 @@ bool eeh_debugfs_no_recover;
>  /* Platform dependent EEH operations */
>  struct eeh_ops *eeh_ops = NULL;
>  
> -/* Lock to avoid races due to multiple reports of an error */
> +/*
> + * confirm_error_lock and eeh_dev_mutex are used together to provide
> + * safety during EEH operations.
> + *
> + * Generally, the spinlock is used in error detection where it's not possible
> + * to use a mutex or where there is potential to deadlock with the mutex, and
> + * the mutex is used during recovery and other PCI related operations. One must
> + * be held when reading and both must be held when making changes to the
> + * protected fields: eeh_pe.parent, child_list, child, edevs and eeh_dev.pe,
> + * .pdev.
> + *
> + * Lock ordering:
> + * - the PCI rescan/remove mutex (see pci_lock_rescan_remove())
> + * - the struct device lock (see device_lock())
> + * - the eeh_dev_mutex mutex (see eeh_recovery_lock())
> + * - the confirm_error_lock spinlock (see eeh_serialize_lock())
> + * - the eeh_eventlist_lock spinlock
> + */

I can't make sense of this list. I probably don't need to take the pci
rescan lock before taking the eeh event list lock, or vis-a-vis, but
that's what it's suggesting.

I'm guessing there's two seperate orderings here?


> @@ -1323,7 +1368,11 @@ void eeh_remove_device(struct pci_dev *dev)
>  	 * for the VF EEH device.
>  	 */
>  	edev->in_error = false;
> +	/* Both locks are required to make changes */
> +	eeh_recovery_must_be_locked();
> +	eeh_serialize_lock(&flags);
>  	dev->dev.archdata.edev = NULL;
> +	eeh_serialize_unlock(flags);

So pci_dev->dev.archdata.edev is also covered by eeh_serialize_lock()?


> +struct pci_dev **pdev_cache_list_create(struct eeh_pe *root)
>  {
>  	struct eeh_pe *pe;
>  	struct eeh_dev *edev, *tmp;
> +	struct pci_dev **pdevs;
> +	int i, n;
> +
> +	n = 0;
> +	eeh_for_each_pe(root, pe) eeh_pe_for_each_dev(pe, edev, tmp) {
> +		if (edev->pdev)
> +			n++;
> +	}
> +	pdevs = kmalloc(sizeof(*pdevs) * (n + 1), GFP_KERNEL);
> +	if (WARN_ON_ONCE(!pdevs))
> +		return NULL;
> +	i = 0;
> +	eeh_for_each_pe(root, pe) eeh_pe_for_each_dev(pe, edev, tmp) {
> +		if (i < n) {
> +			get_device(&edev->pdev->dev);
> +			pdevs[i++] = edev->pdev;
> +		}
> +	}
> +	if (WARN_ON_ONCE(i < n))
> +		n = i;
> +	pdevs[n] = NULL; /* terminator */
> +	return pdevs;
> +}
> +
> +static void pdev_cache_list_destroy(struct pci_dev **pdevs)
> +{
> +	struct pci_dev **pdevp;
> +
> +	for (pdevp = pdevs; pdevp && *pdevp; pdevp++)
> +		put_device(&(*pdevp)->dev);
> +	kfree(pdevs);
> +}
> +
> +static void eeh_pe_report(const char *name, struct eeh_pe *root,
> +			  eeh_report_fn fn, enum pci_ers_result *result)
> +{
> +	struct pci_dev **pdevs, **pdevp;
>  
>  	pr_info("EEH: Beginning: '%s'\n", name);
> -	eeh_for_each_pe(root, pe) eeh_pe_for_each_dev(pe, edev, tmp)
> -		eeh_pe_report_edev(edev, fn, result);
> +	/*
> +	 * It would be convenient to continue to hold the recovery lock here
> +	 * but driver callbacks can take a very long time or never return at
> +	 * all.
> +	 */
> +	pdevs = pdev_cache_list_create(root);
> +	for (pdevp = pdevs; pdevp && *pdevp; pdevp++) {
> +		/*
> +		 * NOTE! eeh_recovery_lock() is released briefly
> +		 * in eeh_pe_report_pdev()
> +		 */
> +		eeh_pe_report_pdev(*pdevp, fn, result);
> +	}
> +	pdev_cache_list_destroy(pdevs);

So the cache stuff is taking a ref to all the pci_devs under that PE. I
assume that's to keep the eeh_dev->pdev pointer valid for the whole
time we don't have the recovery_lock held? I don't really see why we
need to care though since we're not holding a reference to the pdev
itself and the removal should happen while we're in the driver
callback. Is this a hold over from when the eeh_dev would be removed
with the pci_dev was released?

> @@ -477,17 +554,44 @@ static void *eeh_add_virt_device(struct eeh_dev *edev)
>  	}
>  
>  #ifdef CONFIG_PCI_IOV
> -	pci_iov_add_virtfn(edev->physfn, eeh_dev_to_pdn(edev)->vf_index);
> +	{
> +		struct pci_dev *physfn = edev->physfn;
> +		int vf_index = eeh_dev_to_pdn(edev)->vf_index;
> +
> +		get_device(&physfn->dev);
> +		eeh_recovery_unlock();
> +		/*
> +		 * This PCI operation will call back into EEH code where the
> +		 * recovery lock will be acquired, so it must be released here,
> +		 * first:
> +		 */
> +		pci_iov_add_virtfn(physfn, vf_index);
> +		put_device(&physfn->dev);
> +		eeh_recovery_lock();
> +	}
>  #endif
>  	return NULL;
>  }
>  
> -static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
> +/*
> + * It's important that this function take a pdev as a parameter, because they
> + * are protected by a reference count. An edev could be lost when the recovery
> + * lock is dropped (which it must be in order to take the PCI rescan/remove
> + * lock without risking a deadlock).

Same comments as above. Even if an edev goes away does it matter? The
remove will be handled by code that properly handles the locking. Also
with the change that moved eeh_remove_device() from the
pcibios_release_device() into the bus removal notifier this won't stop
the eeh_dev from being removed.


> @@ -1118,6 +1273,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>   * Called when an EEH event is detected but can't be narrowed down to a
>   * specific PE.  Iterates through possible failures and handles them as
>   * necessary.
> + * XXX TODO Needs to be checked sync work

stale comment or is it fine?


> @@ -445,6 +474,9 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
>  	}
>  	pe->parent = parent;
>  
> +	if (parent->state & EEH_PE_RECOVERING)
> +		pe->state |= EEH_PE_RECOVERING;
> +

What's actually required to hit this case? All I can think of is
discovering a new bridge during a post-reset rescan. A new brige would
mean a new PE would be allocated for the downstream bus.

> @@ -141,13 +144,21 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
>  	if (ret != 5)
>  		return -EINVAL;
>  
> +	/*
> +	 * Use the spinlock rather than the mutex so that errors can be
> +	 * injected during slow recovery operations (for testing).
> +	 */
> +	eeh_serialize_lock(&flags);
>  	/* Retrieve PE */
>  	pe = eeh_pe_get(hose, pe_no, 0);
> -	if (!pe)
> +	if (!pe) {
> +		eeh_serialize_unlock(flags);
>  		return -ENODEV;
> +	}
>  
>  	/* Do error injection */
>  	ret = eeh_ops->err_inject(pe, type, func, addr, mask);
> +	eeh_serialize_unlock(flags);
>  	return ret < 0 ? ret : count;
>  }

We could probably make this just look at the powernv phb state directly
and avoid touching the eeh_pe at all. The only bit of the eeh_pe that
we care about is the pe number which the user already provided.

I suppose we care about validating that the PE is in use, but it might
be useful to allow unused PEs to be injected into. That would help with
testing errors during device probe, etc.

