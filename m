Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB12DDFD8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 19:55:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46x6rF15dLzDqPf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 04:55:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46x4TK5MtDzDqNp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 03:09:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="HZkr9mE9"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46x4TK0DC3z8tT3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 03:09:09 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46x4TJ5ndDz9sPT; Mon, 21 Oct 2019 03:09:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=zohar@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="HZkr9mE9"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46x4TH5N00z9sPL;
 Mon, 21 Oct 2019 03:09:07 +1100 (AEDT)
Received: from localhost.localdomain (ool-18bba523.dyn.optonline.net
 [24.187.165.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAB83218BA;
 Sun, 20 Oct 2019 16:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571587744;
 bh=2rqZqTghk0jq/6poDX1vz2pfYzf7Qp8iUns4NuEy5NQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=HZkr9mE9kNuZvNX5TVBK80qFqOhhKOI6Vd4XPcDsexisoiZQIUZLZ/LAj/FksDrGR
 bgMOem4aYqutYg8IUTz77yWm6QiAJnF4ImF78HC7TIBhqG66WXDFG2MSG0pQ0AA/ea
 uVPisOxbE+dqQv9ilAzF5wVw96sXtT4B8LpkVHCY=
Message-ID: <1571587740.5104.10.camel@kernel.org>
Subject: Re: [PATCH v8 7/8] ima: check against blacklisted hashes for files
 with modsig
From: Mimi Zohar <zohar@kernel.org>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org, 
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Sun, 20 Oct 2019 12:09:00 -0400
In-Reply-To: <1571587602.5104.8.camel@linux.ibm.com>
References: <1571508377-23603-1-git-send-email-nayna@linux.ibm.com>
 <1571508377-23603-8-git-send-email-nayna@linux.ibm.com>
 <1571587602.5104.8.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Oct 2019 04:53:50 +1100
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Prakhar Srivastava <prsriva02@gmail.com>,
 linux-kernel@vger.kernel.org, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2019-10-20 at 12:06 -0400, Mimi Zohar wrote:
> On Sat, 2019-10-19 at 14:06 -0400, Nayna Jain wrote:
> > Asymmetric private keys are used to sign multiple files. The kernel
> > currently support checking against blacklisted keys. However, if the
> > public key is blacklisted, any file signed by the blacklisted key will
> > automatically fail signature verification. We might not want to blacklist
> > all the files signed by a particular key, but just a single file.
> > Blacklisting the public key is not fine enough granularity.
> > 
> > This patch adds support for checking against the blacklisted hash of the
> > file based on the IMA policy. The blacklisted hash is the file hash
> > without the appended signature. Defined is a new policy option
> > "appraise_flag=check_blacklist".
> 
> Please add an example of how to blacklist a file with an appended
> signature.  The simplest example that works on x86 as well as Power
> would be blacklisting a kernel module.  The example should include
> calculating the kernel module hash without the appended signature,
> enabling the Kconfig option (CONFIG_SYSTEM_BLACKLIST_HASH_LIST), and
> the blacklist hash format (eg. "bin:<file hash>").

And of course, the IMA appraise kernel module policy rule containing
"appraise_flag=check_blacklist".

thanks,

Mimi
