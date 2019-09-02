Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96640A556B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:59:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MTCg3R9bzDqdd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 21:59:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MT7165s9zDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 21:55:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46MT6y5HYKz9sNf; Mon,  2 Sep 2019 21:55:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46MT6y1cwhz9sDQ;
 Mon,  2 Sep 2019 21:55:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3 3/4] x86/efi: move common keyring handler functions to
 new file
In-Reply-To: <1566825818-9731-4-git-send-email-nayna@linux.ibm.com>
References: <1566825818-9731-1-git-send-email-nayna@linux.ibm.com>
 <1566825818-9731-4-git-send-email-nayna@linux.ibm.com>
Date: Mon, 02 Sep 2019 21:55:36 +1000
Message-ID: <87pnkisyiv.fsf@mpe.ellerman.id.au>
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nayna Jain <nayna@linux.ibm.com> writes:

> The handlers to add the keys to the .platform keyring and blacklisted
> hashes to the .blacklist keyring is common for both the uefi and powerpc
> mechanisms of loading the keys/hashes from the firmware.
>
> This patch moves the common code from load_uefi.c to keyring_handler.c
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  security/integrity/Makefile                   |  3 +-
>  .../platform_certs/keyring_handler.c          | 80 +++++++++++++++++++
>  .../platform_certs/keyring_handler.h          | 32 ++++++++
>  security/integrity/platform_certs/load_uefi.c | 67 +---------------
>  4 files changed, 115 insertions(+), 67 deletions(-)
>  create mode 100644 security/integrity/platform_certs/keyring_handler.c
>  create mode 100644 security/integrity/platform_certs/keyring_handler.h

This has no acks from security folks, though I'm not really clear on who
maintains those files.

Do I take it because it's mostly just code movement people are OK with
it going in via the powerpc tree?

cheers

> diff --git a/security/integrity/Makefile b/security/integrity/Makefile
> index 19faace69644..525bf1d6e0db 100644
> --- a/security/integrity/Makefile
> +++ b/security/integrity/Makefile
> @@ -11,7 +11,8 @@ integrity-$(CONFIG_INTEGRITY_SIGNATURE) += digsig.o
>  integrity-$(CONFIG_INTEGRITY_ASYMMETRIC_KEYS) += digsig_asymmetric.o
>  integrity-$(CONFIG_INTEGRITY_PLATFORM_KEYRING) += platform_certs/platform_keyring.o
>  integrity-$(CONFIG_LOAD_UEFI_KEYS) += platform_certs/efi_parser.o \
> -					platform_certs/load_uefi.o
> +				      platform_certs/load_uefi.o \
> +				      platform_certs/keyring_handler.o
>  integrity-$(CONFIG_LOAD_IPL_KEYS) += platform_certs/load_ipl_s390.o
>  $(obj)/load_uefi.o: KBUILD_CFLAGS += -fshort-wchar
>  
> diff --git a/security/integrity/platform_certs/keyring_handler.c b/security/integrity/platform_certs/keyring_handler.c
> new file mode 100644
> index 000000000000..c5ba695c10e3
> --- /dev/null
> +++ b/security/integrity/platform_certs/keyring_handler.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/kernel.h>
> +#include <linux/sched.h>
> +#include <linux/cred.h>
> +#include <linux/err.h>
> +#include <linux/efi.h>
> +#include <linux/slab.h>
> +#include <keys/asymmetric-type.h>
> +#include <keys/system_keyring.h>
> +#include "../integrity.h"
> +
> +static efi_guid_t efi_cert_x509_guid __initdata = EFI_CERT_X509_GUID;
> +static efi_guid_t efi_cert_x509_sha256_guid __initdata =
> +	EFI_CERT_X509_SHA256_GUID;
> +static efi_guid_t efi_cert_sha256_guid __initdata = EFI_CERT_SHA256_GUID;
> +
> +/*
> + * Blacklist a hash.
> + */
> +static __init void uefi_blacklist_hash(const char *source, const void *data,
> +				       size_t len, const char *type,
> +				       size_t type_len)
> +{
> +	char *hash, *p;
> +
> +	hash = kmalloc(type_len + len * 2 + 1, GFP_KERNEL);
> +	if (!hash)
> +		return;
> +	p = memcpy(hash, type, type_len);
> +	p += type_len;
> +	bin2hex(p, data, len);
> +	p += len * 2;
> +	*p = 0;
> +
> +	mark_hash_blacklisted(hash);
> +	kfree(hash);
> +}
> +
> +/*
> + * Blacklist an X509 TBS hash.
> + */
> +static __init void uefi_blacklist_x509_tbs(const char *source,
> +					   const void *data, size_t len)
> +{
> +	uefi_blacklist_hash(source, data, len, "tbs:", 4);
> +}
> +
> +/*
> + * Blacklist the hash of an executable.
> + */
> +static __init void uefi_blacklist_binary(const char *source,
> +					 const void *data, size_t len)
> +{
> +	uefi_blacklist_hash(source, data, len, "bin:", 4);
> +}
> +
> +/*
> + * Return the appropriate handler for particular signature list types found in
> + * the UEFI db and MokListRT tables.
> + */
> +__init efi_element_handler_t get_handler_for_db(const efi_guid_t *sig_type)
> +{
> +	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) == 0)
> +		return add_to_platform_keyring;
> +	return 0;
> +}
> +
> +/*
> + * Return the appropriate handler for particular signature list types found in
> + * the UEFI dbx and MokListXRT tables.
> + */
> +__init efi_element_handler_t get_handler_for_dbx(const efi_guid_t *sig_type)
> +{
> +	if (efi_guidcmp(*sig_type, efi_cert_x509_sha256_guid) == 0)
> +		return uefi_blacklist_x509_tbs;
> +	if (efi_guidcmp(*sig_type, efi_cert_sha256_guid) == 0)
> +		return uefi_blacklist_binary;
> +	return 0;
> +}
> diff --git a/security/integrity/platform_certs/keyring_handler.h b/security/integrity/platform_certs/keyring_handler.h
> new file mode 100644
> index 000000000000..2462bfa08fe3
> --- /dev/null
> +++ b/security/integrity/platform_certs/keyring_handler.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef PLATFORM_CERTS_INTERNAL_H
> +#define PLATFORM_CERTS_INTERNAL_H
> +
> +#include <linux/efi.h>
> +
> +void blacklist_hash(const char *source, const void *data,
> +		    size_t len, const char *type,
> +		    size_t type_len);
> +
> +/*
> + * Blacklist an X509 TBS hash.
> + */
> +void blacklist_x509_tbs(const char *source, const void *data, size_t len);
> +
> +/*
> + * Blacklist the hash of an executable.
> + */
> +void blacklist_binary(const char *source, const void *data, size_t len);
> +
> +/*
> + * Return the handler for particular signature list types found in the db.
> + */
> +efi_element_handler_t get_handler_for_db(const efi_guid_t *sig_type);
> +
> +/*
> + * Return the handler for particular signature list types found in the dbx.
> + */
> +efi_element_handler_t get_handler_for_dbx(const efi_guid_t *sig_type);
> +
> +#endif
> diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
> index 81b19c52832b..4369204a19cd 100644
> --- a/security/integrity/platform_certs/load_uefi.c
> +++ b/security/integrity/platform_certs/load_uefi.c
> @@ -9,6 +9,7 @@
>  #include <keys/asymmetric-type.h>
>  #include <keys/system_keyring.h>
>  #include "../integrity.h"
> +#include "keyring_handler.h"
>  
>  static efi_guid_t efi_cert_x509_guid __initdata = EFI_CERT_X509_GUID;
>  static efi_guid_t efi_cert_x509_sha256_guid __initdata =
> @@ -67,72 +68,6 @@ static __init void *get_cert_list(efi_char16_t *name, efi_guid_t *guid,
>  	return db;
>  }
>  
> -/*
> - * Blacklist a hash.
> - */
> -static __init void uefi_blacklist_hash(const char *source, const void *data,
> -				       size_t len, const char *type,
> -				       size_t type_len)
> -{
> -	char *hash, *p;
> -
> -	hash = kmalloc(type_len + len * 2 + 1, GFP_KERNEL);
> -	if (!hash)
> -		return;
> -	p = memcpy(hash, type, type_len);
> -	p += type_len;
> -	bin2hex(p, data, len);
> -	p += len * 2;
> -	*p = 0;
> -
> -	mark_hash_blacklisted(hash);
> -	kfree(hash);
> -}
> -
> -/*
> - * Blacklist an X509 TBS hash.
> - */
> -static __init void uefi_blacklist_x509_tbs(const char *source,
> -					   const void *data, size_t len)
> -{
> -	uefi_blacklist_hash(source, data, len, "tbs:", 4);
> -}
> -
> -/*
> - * Blacklist the hash of an executable.
> - */
> -static __init void uefi_blacklist_binary(const char *source,
> -					 const void *data, size_t len)
> -{
> -	uefi_blacklist_hash(source, data, len, "bin:", 4);
> -}
> -
> -/*
> - * Return the appropriate handler for particular signature list types found in
> - * the UEFI db and MokListRT tables.
> - */
> -static __init efi_element_handler_t get_handler_for_db(const efi_guid_t *
> -						       sig_type)
> -{
> -	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) == 0)
> -		return add_to_platform_keyring;
> -	return 0;
> -}
> -
> -/*
> - * Return the appropriate handler for particular signature list types found in
> - * the UEFI dbx and MokListXRT tables.
> - */
> -static __init efi_element_handler_t get_handler_for_dbx(const efi_guid_t *
> -							sig_type)
> -{
> -	if (efi_guidcmp(*sig_type, efi_cert_x509_sha256_guid) == 0)
> -		return uefi_blacklist_x509_tbs;
> -	if (efi_guidcmp(*sig_type, efi_cert_sha256_guid) == 0)
> -		return uefi_blacklist_binary;
> -	return 0;
> -}
> -
>  /*
>   * Load the certs contained in the UEFI databases into the platform trusted
>   * keyring and the UEFI blacklisted X.509 cert SHA256 hashes into the blacklist
> -- 
> 2.20.1
