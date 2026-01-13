Return-Path: <linuxppc-dev+bounces-15625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DC8D18933
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 12:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr6y71NH0z2xjb;
	Tue, 13 Jan 2026 22:50:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768305039;
	cv=none; b=kDpzXKP3Pp3ClbTL0XSVZ+0yR/Yb2Q9DXtiY4QvEQyBNM2YyCyz6v68H/G7CwEEShWrzk+9Na0G1BGcVTu6xlpIOjqFhsmAvA5Aw8egiO4Xg3xZLZQt9R3r5+Zgc/wjA9fNyHplFvX1aMkjrEf5jgwzUL8PIZOK6yK1vB0/LbD1DDC+2Vzmda8mPpUQiNsm2CWDlvsnFfosTCVuhz4sIF0P4M3AFoGUVcFpep3VDJ8To441N+rO2+9mXb7mIUHvxzZS2fryjbsmex4vQaOH33CaCZ+wrNXqNd5emmS0FWhTo9/9DnXv2s3fOx0Yo3+EKz5Doyg80QDs85wL/US8Ntw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768305039; c=relaxed/relaxed;
	bh=n4OVLfYY0h+IhJRy0NAJNM9iTR92XV2VZ5uyTVzCW10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lP6zTuX2n39LCRDHr8U4YXTRbJiFNjuUmWuK5C0C2ohu94JCuHmuiFUx6lKcLgvxSi0jBysLYnNMZPHfy6goD9PfdtlEnupYUO2j73sn00/IBhSzLhUr+SzVqpcbbM6r1lQ5nkfNaz/z/BumBNEV6bCf3PjoPvvqzauRg9V1uqEFkTJkfDux4XTTam0oWDTF86U+U1z9z9jpRLcOyklXUJEgpzKYTrLFDH4Cxz4k5nW9sbPwnkfMtj7VC+JbQQs69IFw2lD1VhOXTKt/SQtK8LmeGqmhaPpNLFLVthPg3t22rxqUx4sbFheNyu74gjhKpwa5PSRSYiMKJNIetQZ/TQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IK6cGx34; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IK6cGx34;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr6y21bpnz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 22:50:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=n4OV
	LfYY0h+IhJRy0NAJNM9iTR92XV2VZ5uyTVzCW10=; b=IK6cGx348zX7nPG426bj
	8pPnKRpaSVk7EenccYs2FR7/yoEeCbW95pRoGqMTBs3I4Rx4GXVA2VKIqoiZm3lP
	i4KGG6AZ8yTUBSwhhme6M4Tb+jyrWuCOfdoAb2OK1uVl/DGQvEeeN4sTV6b6oUxh
	JX3+mzlFDfkdfFVHJDTMKv+5v4hiUFNPlM86mcoJc3DCYD6p/P2G0FwdXGDxAyCT
	X74tcUuRdXObFtGQ6Su9RVR+dLqe+0lCYNQxILagDFy/f6uijcSKThYtmM+ZT+uh
	NWW/idAeMF6/hdDpaKi+GzTZT2BNpV0/aLndK4mEUffpmWU1arEmQE8L+528wqcS
	eg==
Received: (qmail 1666866 invoked from network); 13 Jan 2026 12:50:25 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 12:50:25 +0100
X-UD-Smtp-Session: l3s3148p1@FUTjmENItsIujnvx
Date: Tue, 13 Jan 2026 12:50:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aWYxgXn_2WlHLcj1@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aWYiJbtueA8g3srn@ninjato>
 <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
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
In-Reply-To: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> Yes, I agree it's too late to queue it for v7.0. I actually wanted to
> rename my macro to i2c_debug() to avoid a conflict with saa7134 but
> you're right, I may submit a patch for that instead for v7.0.

Your choice. I think keeping 'i2c_dbg' is more consistent but the
dependency on media might not be worth it.

I set your patches to 'Deferred' in patchwork. Meaning that they will be
handled as agreed above.


