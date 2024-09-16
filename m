Return-Path: <linuxppc-dev+bounces-1403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8BF97A040
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 13:30:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6jQg09mcz2yPj;
	Mon, 16 Sep 2024 21:30:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726486250;
	cv=none; b=WjV4PseawJAgnyikzaIx1tEY1/qI8EV6qO78URx5EsShpXQk2Q3hUSHA7QVOrsgrH9ViSKo1u+RmwLSXeDypq2zdGs3dn0lwE2xvtWJ3uVafOcj5i3svaEaQyuL0FZS70Wnkhq1e429ixKRFP18CN1hdKn3TZt1Gbk9rlXLWKGaj+87AX4iwytvaGcIizQ4a3MZ4u7KkzM97QYoswGDwf2uazm1pw5JunpCx06O1r5NKG3FdTTuLAT7Nd4tmIef6ku+5ICCeIVLXAO61B4Edhmzh9CH3sGFEztDBN1K+qo7/bcMh3oRjbTY2H+CrO3BIljBd1NcOoFmqEyYRFVsLAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726486250; c=relaxed/relaxed;
	bh=m6jH1htB5FdgJVoEJa4KBdZa2hyJQgdYmVTkYudxVTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccsLsvt7dac4vpWcXwDR5J9Wqze1RA4tgjaM6Bn4wRSfGEqBoa4L4NwiSyHAMJ/Hs+AiU7/CXEAYlhV2h6IbbM2+iEcJvFYGMN6ufdBKDTvTJgXdrJqdDgeZN2S0SLSSGfY76uqFoEGvAqUvlU7b4WpbtWx+6X13tru+Fdy4Hgqo+dIrT80BluVKTpTmdGcwdVZhOlPoqkIVFbrVoWI84Ev/x7QMjSGMxgPf586QBPHV/dx2zgzpxJwzXL2VFHOuw8ZdxcGkcN8D8cPjVtgHqyv7sRbB3Z5alHZgOhh7d0Gvk+OvnvbevFJ3pBfKY+X6lHDrGVSrrOvtNti5wIYjCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6jQY36s0z2yPR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 21:30:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m6jH1htB5FdgJVoEJa4KBdZa2hyJQgdYmVTkYudxVTc=; b=Y+TA9OvjKnKh5m1TmqaZU1DKj+
	/VHFL/XVtOCU5oV4v83bhqgxlzAIOd/KOgboFPNQAAyVd1WZFMOmtP/mlTgyoXbJ2ObmN+GqcfO9K
	CI6ZhGma0WIkcyz5gv2/UWMSDF4tjn/FveacprrRRFLHv4EWX7MXFrSJnw1dZRxLnqBPw5A43q/r8
	hds0r7zUcFlS3Iqx4TqUD5nNZJa+LnVwiqmxI/A8ItVb8RRqiqBvlvBqSqMJq8RfiMXm/OIkprs2I
	ZvyMYt0fLeyIryYjP12Mb8qECEDCfZ9YxbxQLPm8KbreqicWlUkzj8AyKQsQF1JV3dZ01zxQBIPwi
	Qtm8gdsQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1sq9w6-00000000NdC-3K0h;
	Mon, 16 Sep 2024 11:30:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 41D0230049D; Mon, 16 Sep 2024 13:30:30 +0200 (CEST)
Date: Mon, 16 Sep 2024 13:30:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	vschneid@redhat.com, mingo@kernel.org, sfr@canb.auug.org.au
Subject: Re: [PowerPC][Linux-next][6.11.0-rc4-next-20240820] OOPs while
 running LTP FS Stress
Message-ID: <20240916113030.GZ4723@noisy.programming.kicks-ass.net>
References: <82b9c434-a0fd-4488-95be-a45b8cd4b6e6@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82b9c434-a0fd-4488-95be-a45b8cd4b6e6@linux.vnet.ibm.com>

On Mon, Sep 16, 2024 at 12:00:52PM +0530, Venkat Rao Bagalkote wrote:

> I am seeing below kernel crash from 6.11.0-rc4-next-20240820.

0820 is almost a month old by now, did you verify if the same happens on
a recent kernel? We did fix a bunch of issues around this.

