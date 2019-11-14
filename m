Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 676DCFC4C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 11:56:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DJLl4nRVzDqnT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 21:56:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DGr44KTpzF5cH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:48:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="U77pto+x"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47DGr41zmRz8snw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:48:04 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47DGr415Krz9sP6; Thu, 14 Nov 2019 20:48:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="U77pto+x"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47DGr30WqXz9s7T;
 Thu, 14 Nov 2019 20:48:02 +1100 (AEDT)
Received: from localhost (unknown [61.58.47.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A7A620715;
 Thu, 14 Nov 2019 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573724880;
 bh=aENC5+uqOt8x8k+ADiNUuSTlGYJaOZ2quvrGJvqWymA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U77pto+xf9jrnoKspvyzQb985Tr5D5ytMcnOHuYeHgUkP0MblJgFv2wef5vEDJRHQ
 GGVrwmuvD2E1SnpHs+N/qxs0wHt9+Oq7SxovW3t/k/ZOFJmWpjTN+miORfCWjndAJX
 S35KA6XKHK7RYSWfL330CTKrkX7Uj5/wPOlkcI9E=
Date: Thu, 14 Nov 2019 17:47:58 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] sysfs: Fixes __BIN_ATTR_WO() macro
Message-ID: <20191114094758.GB631558@kroah.com>
References: <1569973038-2710-1-git-send-email-nayna@linux.ibm.com>
 <47DFxf2Pscz9s7T@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47DFxf2Pscz9s7T@ozlabs.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 14, 2019 at 08:07:49PM +1100, Michael Ellerman wrote:
> On Tue, 2019-10-01 at 23:37:18 UTC, Nayna Jain wrote:
> > This patch fixes the size and write parameter for the macro
> > __BIN_ATTR_WO().
> > 
> > Fixes: 7f905761e15a8 ("sysfs: add BIN_ATTR_WO() macro")
> > Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> 
> Applied to powerpc next, thanks.
> 
> https://git.kernel.org/powerpc/c/39a963b457b5c6cbbdc70441c9d496e39d151582

Why?  This is already in 5.4-rc5, why do you need/want it again?

thanks,

greg k-h
