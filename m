Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D719D1A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 16:27:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HDqM6BfQzDqlS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 00:27:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HDFf5YyZzDqP0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 00:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="tlMjEtZ/"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46HDFd0z6cz8t0l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 00:01:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46HDFZ5lglz9sN4; Tue, 27 Aug 2019 00:01:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="tlMjEtZ/"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46HDFY4qrkz9sMr;
 Tue, 27 Aug 2019 00:01:36 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFDBB2173E;
 Mon, 26 Aug 2019 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566828094;
 bh=gPz4wzPC17jbgMO86fVkOAlhLpUk0FXF6vl4/58WHts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tlMjEtZ/iEjWrikes+vLlInuU046SluV9TWPapUiXpJt/+bPV12BRKcf0Q4/FMFUB
 Q3eGS7vM/v7cSmwjsdkUHluJswE6k0jlwNahYu1SPgkS0vpB6w3XaQbk1izIuX453X
 FlTc/fr819cZx7DdefGzUll8THxgEnejTsIiBA0o=
Date: Mon, 26 Aug 2019 16:01:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [PATCH v3 2/4] powerpc: expose secure variables to userspace via
 sysfs
Message-ID: <20190826140131.GA15270@kroah.com>
References: <1566825818-9731-1-git-send-email-nayna@linux.ibm.com>
 <1566825818-9731-3-git-send-email-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566825818-9731-3-git-send-email-nayna@linux.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 26, 2019 at 09:23:36AM -0400, Nayna Jain wrote:
> +static struct bin_attribute update_attr = {
> +	.attr = {.name = "update", .mode = 0200},
> +	.size = VARIABLE_MAX_SIZE,
> +	.write = update_write,
> +};

Ah, do we need a __BIN_ATTR_WO() macro for you?  That would make this
more obvious, right?

Other than that minor thing (not a complaint at all) looks much better
to me, nice work:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
