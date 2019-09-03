Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85FA5FD3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 05:38:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mt3M6CBxzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 13:38:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mt1G5z9pzDqYL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 13:37:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46Mt1F0k9Gz9sN1; Tue,  3 Sep 2019 13:37:05 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Mt1C3FNgz9sDB;
 Tue,  3 Sep 2019 13:37:03 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH] sysfs: add BIN_ATTR_WO() macro
In-Reply-To: <20190826150153.GD18418@kroah.com>
References: <1566825818-9731-1-git-send-email-nayna@linux.ibm.com>
 <1566825818-9731-3-git-send-email-nayna@linux.ibm.com>
 <20190826140131.GA15270@kroah.com>
 <ff9674e1-1b27-783a-38f3-4fd725353186@linux.vnet.ibm.com>
 <20190826150153.GD18418@kroah.com>
Date: Tue, 03 Sep 2019 13:37:02 +1000
Message-ID: <87ef0yrqxt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> This variant was missing from sysfs.h, I guess no one noticed it before.
>
> Turns out the powerpc secure variable code can use it, so add it to the
> tree for it, and potentially others to take advantage of, instead of
> open-coding it.
>
> Reported-by: Nayna Jain <nayna@linux.ibm.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>
> I'll queue this up to my tree for 5.4-rc1, but if you want to take this
> in your tree earlier, feel free to do so.

OK. This series is blocked on the firmware support going in, so at the
moment it might miss v5.4 anyway. So this going via your tree is no
problem.

If it does make it into v5.4 we can do a fixup patch to use the new
macro once everything's in Linus' tree.

cheers

> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index 965236795750..5420817ed317 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -196,6 +196,12 @@ struct bin_attribute {
>  	.size	= _size,						\
>  }
>  
> +#define __BIN_ATTR_WO(_name) {						\
> +	.attr	= { .name = __stringify(_name), .mode = 0200 },		\
> +	.store	= _name##_store,					\
> +	.size	= _size,						\
> +}
> +
>  #define __BIN_ATTR_RW(_name, _size)					\
>  	__BIN_ATTR(_name, 0644, _name##_read, _name##_write, _size)
>  
> @@ -208,6 +214,9 @@ struct bin_attribute bin_attr_##_name = __BIN_ATTR(_name, _mode, _read,	\
>  #define BIN_ATTR_RO(_name, _size)					\
>  struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
>  
> +#define BIN_ATTR_WO(_name, _size)					\
> +struct bin_attribute bin_attr_##_name = __BIN_ATTR_WO(_name, _size)
> +
>  #define BIN_ATTR_RW(_name, _size)					\
>  struct bin_attribute bin_attr_##_name = __BIN_ATTR_RW(_name, _size)
>  
> -- 
> 2.23.0
