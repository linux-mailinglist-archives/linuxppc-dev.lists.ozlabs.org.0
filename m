Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D14F3DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 12:13:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tcmh2KnqzDqTY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 20:13:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tcky1NfTzDqQX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 20:11:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="YADHNTpg"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 44tckx63cWz9sBr; Tue, 30 Apr 2019 20:11:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1556619113; bh=/3cVNERTeFNHsUu9N/NoL+9iM4miE3OQ/3mWOShCetQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YADHNTpgxSe0EKuGzE4A8KBo387NkTzsK47lXBVfvDMfrxrylvn1IrLnm+Ic3Hsht
 66jPJh0khrpXf8dcgZDLjItpY1WuMYUr3eJBZLlf0JZeaRqJTffklbU4yccaqyLoFY
 WXlPUtcNffp2rnPfd0VSRjzpyocOj3HxoOCsAHwIc3woDjwTdq25lco5x/s+nCZIHa
 gDkxC0BKknl85ITtZs3JL6Nch17VFz/OwqW9rHhK2RqKMO5FpesErdsk1AVyrfwq37
 XUOSCSm0N59pkDi2jjKXhKLR9nqHKglGp95cnJH3kTIwA26uZwNlsquKmg77jnsxRE
 tJQKc4QtRhscg==
Date: Tue, 30 Apr 2019 20:03:23 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: smb->smp comment fixup
Message-ID: <20190430100323.GF32205@blackberry>
References: <20190425195339.12609-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425195339.12609-1-palmer@sifive.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 25, 2019 at 12:53:39PM -0700, Palmer Dabbelt wrote:
> I made the same typo when trying to grep for uses of smp_wmb and figured
> I might as well fix it.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Thanks, patch applied to my kvm-ppc-next tree.

Paul.
