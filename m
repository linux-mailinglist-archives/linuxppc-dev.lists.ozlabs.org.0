Return-Path: <linuxppc-dev+bounces-10192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD037B01F48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 16:36:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdvRH4GKkz30Ql;
	Sat, 12 Jul 2025 00:36:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752244587;
	cv=none; b=XVnHJmAc3PsjmzIAxA0AnP/TY9Wr0ZjqpKzAJUt7R1ie0Us84d5CpKZrSu+kZHbO7LBY8yO9h7WpTnCTm7PF79sHUoUHyGSYjWac8dujlCdmnVD/oC4kn0NG08OnI0D5VTg0yADlG8FvHfwyyrxJfwJuDSoiJW2bRiVnWSalrWGwo4S90ZzBOxle+2QIn0fhNPqYURYA5mNL5rWU3RKdipwUgXh/Nn8HstzKuW4G85dw7GBYK8bOfEeGRxANQ2R04RZMVuSVX/t+v8DNGwcPW1ciMfms7Bm5V2ZaiFdP7NuIC/+B00omgNuLq7z2/QlTV4Z/V+voepua6SWgZ/9TpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752244587; c=relaxed/relaxed;
	bh=grsYows+9sHElnPNNTmSBrFWiRJY83TUzmMJ77We0PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kue9hZAGqYxSxTLU/PRnRmqR72frOx7Bo/pX52wIE/Ly5d9MEUEaWzDdU13KsSdgFrizmJd9PRmPgk8W6eLmiSXdyzj/i6XEVuekheNJVnRz19uiJ59EbuBvn21ZojFkfdCTls49IgUbw9pGYKU5bMLsRPD50f4CEv28NMhPKgsMeea0gO1ZpJXagmz1OWqKZmmeH6LvAquDwNJgMqXvhojGM57+ByuOlzNvn2P7gdU2anLhafRdHpA2g2GZKbGzaxQQRdHF20O7e/GlEMGKgt72rw5gkgEuM9G6qX9L3VFsemh/2VwSohoeKiz/dRkehStqTZfdrckli1P6Vt+Aow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V2Z1W6T5; dkim-atps=neutral; spf=pass (client-ip=91.218.175.171; helo=out-171.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V2Z1W6T5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.171; helo=out-171.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdvRD3zTzz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jul 2025 00:36:23 +1000 (AEST)
Date: Fri, 11 Jul 2025 16:35:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752244561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=grsYows+9sHElnPNNTmSBrFWiRJY83TUzmMJ77We0PI=;
	b=V2Z1W6T57gXqBL7P47kpAxJKjUb9twcwWPHGIJmXcPG5ZoU+rxoKrdN4pkXlQZ3VbFmDqT
	dh18/YI2V2ixNx1Nn1GKxyWiDDf2S4jhhecmukG/j/K3En+iyWOiTYEHMl5YFwGrtgRb/k
	u2yoV9Lr7ZFqZlAGHzN/orAyb9x2K2o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Thomas Huth <thuth@redhat.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, eric.auger@redhat.com, 
	lvivier@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, 
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, shahuang@redhat.com, Boqiao Fu <bfu@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v4 07/13] scripts: Add default arguments
 for kvmtool
Message-ID: <20250711-357d520bb64154cbe119679b@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-8-alexandru.elisei@arm.com>
 <ce92db8c-6d26-4953-9f74-142d00d2bc2a@redhat.com>
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
In-Reply-To: <ce92db8c-6d26-4953-9f74-142d00d2bc2a@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 01:32:33PM +0200, Thomas Huth wrote:
...
> > +function vmm_default_opts()
> > +{
> > +	echo ${vmm_optname[$(vmm_get_target),default_opts]}
> > +}
> 
> 
> This causes now a problem on s390x:
> 
> https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/jobs/10604334029#L591
> 
> scripts/common.bash: line 56: vmm_defaults_opts: command not found
> 
> ... any ideas how to fix it?

This is fixed by https://lore.kernel.org/all/20250709085938.33254-2-andrew.jones@linux.dev/
which I just pushed.

Thanks,
drew

