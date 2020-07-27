Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A99A22E7E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 10:36:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFY7b2rgGzF14k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 18:36:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFY593qZyzDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 18:34:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=AVE2V79d; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFY592jTpz8sxp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 18:34:37 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFY592DBZz9sRR; Mon, 27 Jul 2020 18:34:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.137; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=AVE2V79d; dkim-atps=neutral
X-Greylist: delayed 642 seconds by postgrey-1.36 at bilbo;
 Mon, 27 Jul 2020 18:34:36 AEST
Received: from mx01.puc.rediris.es (outbound1mad.lav.puc.rediris.es
 [130.206.19.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BFY584Mg8z9sRN
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 18:34:36 +1000 (AEST)
Received: from mta-out02.sim.rediris.es (mta-out02.sim.rediris.es
 [130.206.24.44])
 by mx01.puc.rediris.es  with ESMTP id 06R8Nclx000553-06R8Ncm1000553
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 27 Jul 2020 10:23:38 +0200
Received: from mta-out02.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPS id F263AC143E2;
 Mon, 27 Jul 2020 10:23:37 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTP id 9E3D9C143E5;
 Mon, 27 Jul 2020 10:23:37 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out02.sim.rediris.es
Received: from mta-out02.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out02.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uzO0DVWZRF3N; Mon, 27 Jul 2020 10:23:37 +0200 (CEST)
Received: from lt-gp.iram.es (75.red-88-27-245.staticip.rima-tde.net
 [88.27.245.75])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPA id F2D9CC143E2;
 Mon, 27 Jul 2020 10:23:35 +0200 (CEST)
Date: Mon, 27 Jul 2020 10:23:31 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/5] powerpc: Allow 4224 bytes of stack expansion for
 the signal frame
Message-ID: <20200727082331.GA2110@lt-gp.iram.es>
References: <20200724092528.1578671-1-mpe@ellerman.id.au>
 <20200724092528.1578671-2-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724092528.1578671-2-mpe@ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=1ZiclzWz6oRLNeIZ15slU/UsF+W9BEH+Xsbw5PctIeE=;
 b=AVE2V79dBHbGgXqjCH0Kp156+jzlwPfSIyCjGr6Gtf4dw7kS/LpXXwsmne4zYQ5FBqsbd+3q/s5y
 JvlpRRdehpXLSBWzkgtmf5caJJvqbUHvrCFykvs9JpJEyOvE/hzs71VhQbJiTwTwfoXhuZK/jr6w
 FjWQFPU6BkL7q17HUxt9y9PRhQUN1hMYi2oR+Mgi+fAwQLEy/sM4JycmET/8I/mGsVgnpzHTyx8t
 RnHFFXFvaSDEylntHhb0rPl3L6FrgzKHk0iU/5g9WS9ZGY7qG4pNNEwza+nxYA00El9rcC0gUr+y
 /l+hJUkZluc9lLyLD2PpSEkZ1rToQES3GKFrGg==
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 24, 2020 at 07:25:25PM +1000, Michael Ellerman wrote:
> We have powerpc specific logic in our page fault handling to decide if
> an access to an unmapped address below the stack pointer should expand
> the stack VMA.
> 
> The code was originally added in 2004 "ported from 2.4". The rough
> logic is that the stack is allowed to grow to 1MB with no extra
> checking. Over 1MB the access must be within 2048 bytes of the stack
> pointer, or be from a user instruction that updates the stack pointer.
> 
> The 2048 byte allowance below the stack pointer is there to cover the
> 288 byte "red zone" as well as the "about 1.5kB" needed by the signal
> delivery code.
> 
> Unfortunately since then the signal frame has expanded, and is now
> 4224 bytes on 64-bit kernels with transactional memory enabled.

Are there really users of transactional memory in the wild? 

Just asking because Power10 removes TM, and Power9 has had some issues
with it AFAICT.

Getting rid of it (if possible) would result in smaller signal frames,
with simpler signal delivery code (probably slightly faster also).

	Gabriel
 

