Return-Path: <linuxppc-dev+bounces-16252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPUTBV7Yc2lNzAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 21:21:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF6B7A913
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 21:21:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyTqG0STYz2xdY;
	Sat, 24 Jan 2026 07:21:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769199705;
	cv=none; b=NJ0AhSYkJEi+2L0J32jInV8AbOzk7OOALKd5gp+XWqnq0Iyre4x60BvYRV4agpCs6YHqLOxk1xG13YrJKf6Sr3CZ/6PJZPBS4NzwtG3a+9X/vao82H5zzx6udNuOVYK1RyR9b8oWgF5jyTZfneiuG8JqS3rsbnJn0hHe50tXOoQx2fQpSO6GLd2R7UGvsNInDmp+3xA8K9niEu7p/5H8yEfbANcGHLYx6jrVh+Rzewhr+lD6vvuldqMfuSNnPauDMmfdcg0XFTHuf6aH3061uTMhONjsF1OJfxJ7Ajcaxg3/+YcVHB5wqXc0aN6SdOIMu2ZOJbhtvWklEd4RcU6ZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769199705; c=relaxed/relaxed;
	bh=IwrvD8tG+Q8yqXQGRzjwzGuOSu/yOscMg3nMEOhgbZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=F93AL28HhF0Vr3tHpgKA0A6rJWsyLeU34RgdjAv/Ade/IK8ZLCiXtFHbLgr/S6lqH/lubxcLPvmRC8k1deN5T//s9LHaIRD26D+ETKrgTa2O/oT0Gj3GShaxi6joiM8c1oFocz3A5NJcy33fL3ACeiwJ+WdCo8IeH5tBpZbd3wGIQ9dxoVSxyppNDEYYtB8xb3A0HZ5LG83N9tQ4TuB5IhAs9wl+X0gHYchYPgcXApPXiV0bSwLqhSoM6hk2gk5854HsQmMWZxUMFn6PX3NRyAheS8KxfGDRRCrUKIFND8q2NVW+l3MPLcVdPWH4UvFZ1eAlNdewUsJ/WF1D8vLBEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Aqt9nMp9; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Aqt9nMp9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyTqD4HSVz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 07:21:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF57D42D58;
	Fri, 23 Jan 2026 20:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0047C4CEF1;
	Fri, 23 Jan 2026 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769199701;
	bh=8oWPlenlkiFGuWSiLTXLR7/Gzzv217xLGkIacaMBE4g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Aqt9nMp9C4EDme27BeU7DrpwlRNf4awubw2KJxs6e3HKx6Jm5hevZhDC08i1vVfMo
	 msVzcIt/OKBtINZUdgOz9XQIdRz2PJvEdXSlfgLfQgYj3LZfYYDUjw7spW3+ruaU80
	 P1EGhnWG0yw4BtuOK+A1/jLpheNyM9u38SwSHwDligpUd6Mi+yPcBI6Ddy+9q+dB8J
	 KcT14FCEcOSJvulV6BQ2sw1B/QU6Kuy9uxUWxGKwV5cUUTiQ/3WWMeKZ3OPVdIkag0
	 O+UaUnMGNcP3W/PC0VPUMn96CK01uFGFkEwxDVweX412/wWxnt0L8v+kl1pK3WAr3S
	 UZr/U03On9AZg==
Date: Fri, 23 Jan 2026 14:21:40 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
Cc: mahesh@linux.ibm.com, oohall@gmail.com, bhelgaas@google.com,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, CobeChen@zhaoxin.com,
	TonyWWang@zhaoxin.com, ErosZhang@zhaoxin.com,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] PCI: dpc: Increase pciehp waiting time for DPC recovery
Message-ID: <20260123202140.GA84703@bhelgaas>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123104034.429060-1-LeoLiu-oc@zhaoxin.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com,google.com,lists.ozlabs.org,vger.kernel.org,zhaoxin.com,wunner.de];
	TAGGED_FROM(0.00)[bounces-16252-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:LeoLiu-oc@zhaoxin.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:CobeChen@zhaoxin.com,m:TonyWWang@zhaoxin.com,m:ErosZhang@zhaoxin.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_SPAM(0.00)[0.334];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ADF6B7A913
X-Rspamd-Action: no action

[+cc Lukas, pciehp expert and author of a97396c6eb13]

On Fri, Jan 23, 2026 at 06:40:34PM +0800, LeoLiu-oc wrote:
> Commit a97396c6eb13 ("PCI: pciehp: Ignore Link Down/Up caused by DPC")
> amended PCIe hotplug to not bring down the slot upon Data Link Layer State
> Changed events caused by Downstream Port Containment.
> 
> However, PCIe hotplug (pciehp) waits up to 4 seconds before assuming that
> DPC recovery has failed and disabling the slot. This timeout period is
> insufficient for some PCIe devices.
> For example, the E810 dual-port network card driver needs to take over
> 10 seconds to execute its err_detected() callback.
> Since this exceeds the maximum wait time allowed for DPC recovery by the
> hotplug IRQ threads, a race condition occurs between the hotplug thread and
> the dpc_handler() thread.

Add blank lines between paragraphs.

Include the name of the E810 driver so we can easily find the
.err_detected() callback in question.  Actually, including the *name*
of that callback would be a very direct way of doing this :)

I guess the problem this fixes is that there was a PCIe error that
triggered DPC, and the E810 .err_detected() works but takes longer
than expected, which results in pciehp disabling the slot when it
doesn't need to?  So the user basically sees a dead E810 device?

It seems unfortunate that we have this dependency on the time allowed
for .err_detected() to execute.  It's nice if adding arbitrary delay
doesn't break things, but maybe we can't always achieve that.

I see that pci_dpc_recovered() is called from pciehp_ist().  Are we
prepared for long delays there?

> Signed-off-by: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
> ---
>  drivers/pci/pcie/dpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index fc18349614d7..08b5f275699a 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -121,7 +121,7 @@ bool pci_dpc_recovered(struct pci_dev *pdev)
>  	 * but reports indicate that DPC completes within 4 seconds.
>  	 */
>  	wait_event_timeout(dpc_completed_waitqueue, dpc_completed(pdev),
> -			   msecs_to_jiffies(4000));
> +			   msecs_to_jiffies(16000));

It looks like this breaks the connection between the "completes within
4 seconds" comment and the 4000ms wait_event timeout.

>  	return test_and_clear_bit(PCI_DPC_RECOVERED, &pdev->priv_flags);
>  }
> -- 
> 2.43.0
> 

