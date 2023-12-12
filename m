Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5D480F929
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 22:24:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iigFE0sX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqWp34M2vz3cWQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 08:24:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iigFE0sX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqWnG11vrz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 08:23:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD7AFCE1BA6;
	Tue, 12 Dec 2023 21:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D30C433C9;
	Tue, 12 Dec 2023 21:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702416205;
	bh=/ixDf/FMAeVQ+/FH3AsNSPZ9BcC9ELGE9aI1dGNMoIQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iigFE0sX/7WKAGE22E7MrW/4c+wXyqluQ6d6vh1soqeCaAKuY8p3R2ZL7ifRCIHzU
	 2z4n+o5thjK/+Sg3bN2ZegIK7cLBE/OG49Ee78lgIU1iyMjeMuZ3YDx3v29LPMKYKb
	 jph+hciZcuNVcxbCRZKjqmUB3Tnm9az5BwCWdw4bkMGLH/bFwWxGZCeL7xWbJ05kqA
	 gdcFiURxTcS4OuKVKRJgZgMSLa09fp9rCGzOdQE6q7UM7WzF/bNodABI+VNg9gxP+m
	 ckV1V0bh4Kz7bxLcvxjWzPbwinGk51fT1aYaeZ5G0T5adHKkVNXzTTtk1pC9B83dPw
	 55lJ4EVvwkHGg==
Date: Tue, 12 Dec 2023 15:23:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Terry Bowman <Terry.Bowman@amd.com>
Subject: Re: [PATCH 1/3] PCI/AER: Use 'Correctable' and 'Uncorrectable' spec
 terms for errors
Message-ID: <20231212212323.GA1021034@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ace772f1-475a-4d20-9bf3-3b9901d48dd7@amd.com>
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
Cc: Robert Richter <rrichter@amd.com>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 12, 2023 at 09:00:24AM -0600, Terry Bowman wrote:
> Hi Bjorn,
> 
> Will help prevent confusion. LGTM. 

Thanks a lot for taking a look at these!  I'd like to give you credit
in the log, e.g., "Reviewed-by: Terry Bowman <Terry.Bowman@amd.com>",
but I'm OCD enough that I don't want to translate "LGTM" into that all
by myself.

If you want that credit (and, I guess, the privilege of being cc'd
when we find that these patches break something :)), just reply again
with that actual "Reviewed-by:" text in it.

Bjorn
