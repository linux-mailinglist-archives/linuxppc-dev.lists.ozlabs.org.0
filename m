Return-Path: <linuxppc-dev+bounces-17427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA2WD54Domn5yAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:50:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC7E1BDF4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:50:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fN0pL2j7hz30Sv;
	Sat, 28 Feb 2026 07:50:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772225434;
	cv=none; b=Ok0/8LbIYvuL5W3mmmMSszVf6f3dhLPQq/SckJ2d7FczQoS+2Msa4M7uuN/xxKrd+f28Vafk1P+iuDmDDTsPyx3UF7ZQuNrbEEsLvZqkshroGwIhFQi4VBAr6bDTdGMJDJx36oMi1/4x9jeg+zsGvgUSQb0dJ+rrn6ycUghX6SbvRHotCk+wrMTBEsRQ4yQXDoeOEOsBtm/b4XQS1cDs0B+I+Rmu5AgPkrlgu5g9R0fTAeW6jKTykGABHJvq1XNyl/A3MJTqhYC9DjKbYTO6Hk4J1RLrcS+sUeiA6wO7jlpHdimFTq2HLIAd7jfcGdFX2lLPjt02WKnDj+mCZ2yR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772225434; c=relaxed/relaxed;
	bh=3SwHhUo7f6e3oK+rCDN++8NaoLTRaeldbKCrEssk4FM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJCduMitc5sTSxrqi3jQ42rGfvrQLWPi8nDoeQB4sitdvTILRlToue8cEBgKVXcCYPTjpcml6HCqwLdMKCA2WFi+kOOlih9tBt5zK4wBE7NSN/s35rNw5lZpIooQmBKoygSECWto1v5IFP+atGHMWQ08Zxo4p0yvl0rmNs3b1x5nwERmBonfDuxBKaIGJquRrbVaxHBfqWnhiUysU85msf3vDMDdg0ferqahsKgJ5NVHXc9NC435wnf65KkUxdQlrdCy8G5MCNWSvcmx5Q80yTxHEEOS5Uyk7oOrmeBkPh6DQQgHIjtgWGnDlD5druUDkLTiSmVT4faaNmsNAZoTXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mlauLzQG; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mlauLzQG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fN0pK1hPyz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 07:50:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E5126013C;
	Fri, 27 Feb 2026 20:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E3AC19421;
	Fri, 27 Feb 2026 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772225429;
	bh=W7BP0oevASDZTGnn55NW+Dj0D++HXk3OGi0eWIHJO0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlauLzQGiJZxJYdDtNIppIVaJ+GnRJrKcMLeRVeGHPIhI2MWCe9B3tOjc5B9vf6wi
	 SJKBc2Ih57Wuy76pija0vrdZmZDMt9dWXynCa3zZgMIiiyAJe1Ooy71HEKDtYGnZfH
	 JOJa6I4DnboqaGyvlpn5XyHiIGEMHM1lTNNeoYNCGui7nWNa1CYCaXMHzNp3CsJJmo
	 yJg54Hltr351bhKrwVC5/94dhohmHR+51MxNeV4Elemgqk/h8S0ikc0heZmHYZnizX
	 mJ+hiC+UMkidKcbvtYgtDnJp6z4n+WzZINHAIzHUste9UBiwb0x7bjlg4b78Jvzdk+
	 w2oc3cwGYjKbQ==
Date: Fri, 27 Feb 2026 22:50:24 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Donet Tom <donettom@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-mm@kvack.org
Subject: Re: powerpc/fadump: CMA init is failing
Message-ID: <aaIDkB2xLABDyV1y@kernel.org>
References: <4c338a29-d190-44f3-8874-6cfa0a031f0b@linux.ibm.com>
 <87o6lagljy.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6lagljy.ritesh.list@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17427-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:sourabhjain@linux.ibm.com,m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:mpe@ellerman.id.au,m:donettom@linux.ibm.com,m:hbathini@linux.ibm.com,m:mahesh@linux.ibm.com,m:linux-mm@kvack.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[54.174.64.0:email,1.201.195.198:email]
X-Rspamd-Queue-Id: EFC7E1BDF4A
X-Rspamd-Action: no action

Hi Ritesh,

On Fri, Feb 27, 2026 at 10:39:53PM +0530, Ritesh Harjani wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> 
> > I noticed CMA init for fadump crashkernel memory is failing.
> >
> > [    0.000000] cma: pageblock_order not yet initialized. Called during 
> > early boot?
> > [    0.000000] fadump: Failed to init cma area for firmware-assisted 
> > dump,-22
> >
> >
> > kernel command-line:
> > BOOT_IMAGE=(ieee1275//vdevice/v-scsi@30000070/disk@8100000000000000,msdos2)/vmlinuz-7.0.0-rc1+ 
> > root=/dev/mapper/rhel_ltcden3--lp12-root ro 
> > rd.lvm.lv=rhel_ltcden3-lp12/root rd.lvm.lv=rhel_ltcden3-lp12/swap 
> > fadump=on crashkernel=3G
> >
> >
> > Same issue with kdump CMA reservation:
> >
> > [    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
> > during early boot?
> 
> Good that we added those debug prints ;)
> 
> I think I know what went wrong, as part of this arch,mm consolidation
> patch series [1], I think the order of initialization is changed.
> 
> With this patch the new order is ... 
> start_kernel()
>     - setup_arch()
>        - xxx_cma_reserve();
>     - mm_core_init_early()
>        - free_area_init()
>           - sparse_init()
>              - set_pageblock_order() // this sets the pageblock_order.
> 
> Whereas earlier set_pageblock_order() was called from initmem_init(),
> just before cma reservations were being made. 
> 
> start_kernel()
>     - setup_arch()
>        - initmem_init()
>          - sparse_init()
>            - set_pageblock_order();  // this sets the pageblock_order
>        - xxx_cma_reserve();
> 
> So that means, pageblock_order is not initialized before these cma
> reservation function calls, hence we are seeing these failures.
> 
> setup_arch() {
>     ...
> 
> 	/*
> 	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
> 	 * hugetlb. These must be called after initmem_init(), so that
> 	 * pageblock_order is initialised.
> 	 */
> 	fadump_cma_init();
> 	kdump_cma_reserve();
> 	kvm_cma_reserve();
> 
>     ...
> }
> 
> 
> So what if we do.. 
> 
> start_kernel() {
>   ...
> 	setup_arch(&command_line);
> 	mm_core_init_early();
>     setup_arch_post_mm_core_init(); // and here we call CMA reservation functions ?
 
Unless I'm missing something these cma reservations can be moved to
arch_mm_preinit().
It runs after mm_core_init_early() and before memblock moves the free
memory to the buddy.

> References:
> [1]: https://lore.kernel.org/linuxppc-dev/20260111082105.290734-1-rppt@kernel.org/T/#m5adf1a845e0a0867066c4f7055f28e6304b73fa5
> [2]: https://lore.kernel.org/all/3ae208e48c0d9cefe53d2dc4f593388067405b7d.1729146153.git.ritesh.list@gmail.com/
> 
> 
> -ritesh

-- 
Sincerely yours,
Mike.

