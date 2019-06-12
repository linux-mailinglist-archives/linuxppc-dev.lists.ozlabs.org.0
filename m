Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54778420AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 11:25:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P1gt3tFvzDr32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 19:25:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P1dc0njQzDqwF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 19:23:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ZNWmG+Zd"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45P1db4687z9sDB; Wed, 12 Jun 2019 19:23:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1560331427; bh=bjZAWvkQTQaR1PkqNVvlp/riUcSYq0sHnqBhG7xkM+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZNWmG+ZdHP9hlbOSW4nfoo68xUIEs0/YpDUyeQcANTZHGisIT+86I+Bz22fBP0FX1
 ma/YSu0UcI2pgkep/dUtldILm+a4jn1Img/bl16I2dFodVEEO6AHz4sW22EXl5q0gL
 bS16e78ybKKaWBq59acHfJpZFrKcTHnanyYOg6LLzAOmeee8YJGSy+3bCGXEnUiBe0
 YqECMEHgjhgBJT844uCwfUcZ9QdUJjWk9c4+j9/g3Y12qKGNabR9dsJZ40UiUX/4Bm
 e5W6k4pHrdaBS2saJt+uTJiDY6UnOoHGaY9O5JqCDm8V3ylK0YSo/giZbnGLBrlIsy
 MKROp/lQLAVfg==
Date: Wed, 12 Jun 2019 19:23:42 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix r3 corruption in h_set_dabr()
Message-ID: <20190612092342.GA18684@blackberry>
References: <20190612072229.15832-1-mikey@neuling.org>
 <1ee1cc67-d342-6610-4865-8c52a85e67c1@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ee1cc67-d342-6610-4865-8c52a85e67c1@c-s.fr>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2019 at 09:42:52AM +0200, Christophe Leroy wrote:
> 
> 
> Le 12/06/2019 à 09:22, Michael Neuling a écrit :
> >In commit c1fe190c0672 ("powerpc: Add force enable of DAWR on P9
> >option") I screwed up some assembler and corrupted a pointer in
> >r3. This resulted in crashes like the below from Cédric:
> 
> Iaw Documentation/process/submitting-patches.rst:
> 
> Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
> instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
> to do frotz", as if you are giving orders to the codebase to change
> its behaviour.
> 
> So you could rephrase as follows for instance:
> 
> Commit XXXX ("") screwed up some assembler ....

That advice in submitting-patches.rst is certainly appropriate when
talking about the actual change that the patch makes.  However, it is
also appropriate to give descriptive background material that helps
the reader to understand why the change is necessary -- in this case,
where and how the bug was introduced.  So I'm going to support Mikey
as regards his first few paragraphs.

I agree that the last paragraph that says "This fixes the bug by ..."
could be reworded as "Fix the bug by ...".

Paul.
