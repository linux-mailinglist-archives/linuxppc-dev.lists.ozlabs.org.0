Return-Path: <linuxppc-dev+bounces-16322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OuuIsbXeGmUtgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 16:20:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F39968E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 16:20:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0pxr4218z309N;
	Wed, 28 Jan 2026 02:20:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769527232;
	cv=none; b=WUliIXJ0m/xpzbNV0spHgXH5x1ENf3At8oNkU2fkqq0YwNOnq3jQG/P30TI3d7qT6C0vFCmNSJi5EwoaVdJw/Yn0GRiM+1DfDWxBFRUjWRuqh1WGzy72xIyrMeMkM8R1o1CRJeteLO+OFZkMN6RlSDTEtZ+6pDx/Q8NopI0Z5lZzgw3cN6ylkGYQ09RX9DqS8Cm/NOzWNCd8KKDq3bQWc4s+ZnWvXciGi/crL5yI3/TljPEDXlsRT/U2ZWBfAm3pQA5j1VfNtzgB6OZ0cOixYp7U6h64ME3HcSoLls0Gjv7IvB/O1OfaAuPUdNa1bAlgsF/Ya/OmfXun1hE4RfEJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769527232; c=relaxed/relaxed;
	bh=TpVju2z52ieKZ9g+UW8bQZ3qR3Ja1fAXqmPTBm/6Msg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BqbCXfw64XeY9O3DjqHzzltatGQfKJn86TKumQLdbnL7esvHDkjacGLofxtOaeIG2LVd0gIMbrCNFSlBmn+2SWT8DPEGB15jGf/F5FHJjhWbSAlL/ffGtq69r1c9vg6hxBnMcq27P703FQXaEOkBKtGtKapwM++aHxZVOtowEKiE6zp7t7ZdjAb/StGx8QuUkTdALJmbf/KaZJBS6cOtlx7jj2X608aAnRRbvdRq6jWWOuQ/xIzZxABxrPieWBKNQ6nHbkj9/VU+cmrHBfoXw8RjcqmJsYIkMO1kLL4PxAjQyOIOskVhbqnZHpG4klYtug6zQTwIJrLdtp3keZWmNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BeVRVPqO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=petr.pavlu@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BeVRVPqO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=petr.pavlu@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0pxn48l6z2xXB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 02:20:27 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so45417495e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 07:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769527219; x=1770132019; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpVju2z52ieKZ9g+UW8bQZ3qR3Ja1fAXqmPTBm/6Msg=;
        b=BeVRVPqO0O305RjMJiBj8lTEXhjaLTyvvgDhBrRtBO00+Wx12QPri93zNKjhBW++Ez
         fqLqKxjjyF7U8HLtmQOHR6vpkDk0mVjV9At2pQLhMOxNkFb3oIAYM+PBnxSNJ0LKzxdH
         NfVS8Mxq9fQ/fxa4BgP1/EjhSqcL5Mtp/gnpXHmMeOFOuc5io+nxFJxETdxGcrFNkgsI
         /fiAlujFBHTKZbVIWRIs1TBiS7XF9nepFlVh3B/v8FzTnFkM6FLEdPgqjpU2KdhHputv
         diSmbUBuJEVxah2De4nt4Vd+ABsTbS0bQ+rsNSbKgw0JYBybk1M4aBzxEeVNW/gNTJsi
         0Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527219; x=1770132019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpVju2z52ieKZ9g+UW8bQZ3qR3Ja1fAXqmPTBm/6Msg=;
        b=tWfJvZGMcbG2Rj85S/+7M3MhUqi7skFBlpGqe/PkLXhS8jT7fnYlFmOGIZhuEozmpi
         BDBBHeOwjj9qrtNemQKAvnvRr8xAUDeaCRcZUksw0V26j7lEslfQChE5vIcwzDkEJi9K
         WItuLRy51esXSkMhaBps7f6cMmphgBco2wqasTVK40gRDWQOl1a8Mo1eDDBY5KST0jKx
         tbDYeyr8aBbMpq1JmjiaJAAoGimO440tXualjLYwOLuQHaoylbG/vxrwgcVJVcAq8Rte
         7TzTDDa2lM30lav/Yv/T10srqlJVaKFJ54m+xBPyCsHlVdz/7cp0iAlIFerrH4YLgpyA
         uMPg==
X-Forwarded-Encrypted: i=1; AJvYcCXXfOVHBnAqVOwHWgx4T0TibJ9npfbexMLXJZSS2R0+fyNkpMVjO9rnNOHOEl4xiP9nwDI8jECfOBNviWA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKC8h/sXPUc6CqQ2tDQOtOAO1adabF4zOUr487wNyI7dAeQOsZ
	8fI/Yze165IJjbZaUmXT5z310+cvX2d3+pQuuXHR8rv/tjHw3j5nbGkF08mAZ0et0G0=
X-Gm-Gg: AZuq6aKvoTvtDrMo4gWQDiYC6uwNvq3YpKzEC0RreNNI/p31XLULn/uEkNwN2XhNRiG
	+os9wPdqwUyVp+wGcvTDQwWUNF7WpoXF8lfz3ONRR5XCx5weZuncJ6oFpyq470aRIrcIy+VvWP4
	nt/nzrLL7TYeFQ0Iqku2fVvkLFKB4v2OCO7dh/6BzIEzNDIa2JPFg/6j8nK4/TRr1yaGSMj5aG3
	KXbd3rmbKGwEi8ZBY5Y3C+JIDG0HNN5SU8VVBQAIHOZjR9v5/5eiNAKBNhEd3xQaI/eBr/ky4UI
	/RiRM354aVQCB6iwFdKUuBoTecs4xYC30fCjo10LCByTnko71n5qrnRzQ7OPFqeXpKYAoiQMHkq
	sRUh5WymXC4r49DLvgFxDwOtJNSZBHEAdwCibLT8p1mZuQL2XJyqVBR0bsDdGafNLrqYRjDDAhf
	rZmNo13H+WfHNeHysw4icCpjPjZfgcWMRd8S2nk+h/
X-Received: by 2002:a05:600c:5553:b0:480:1c53:2085 with SMTP id 5b1f17b1804b1-4806a313f35mr20307595e9.19.1769527219144;
        Tue, 27 Jan 2026 07:20:19 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c034dfsm67200105e9.10.2026.01.27.07.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 07:20:18 -0800 (PST)
Message-ID: <52cbbccf-d5b6-4a33-b16a-4a09fe5e64d3@suse.com>
Date: Tue, 27 Jan 2026 16:20:15 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/17] module: Deduplicate signature extraction
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Xiu Jianfeng <xiujianfeng@huawei.com>,
 =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>,
 Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>,
 kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>,
 =?UTF-8?Q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-8-0b932db9b56b@weissschuh.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260113-module-hashes-v4-8-0b932db9b56b@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16322-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:nathan@kernel.org,m:arnd@arndb.de,m:mcgrof@kernel.org,m:samitolvanen@google.com,m:da.gomez@samsung.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:naveen@kernel.org,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:nicolas.schier@linux.dev,m:da.gomez@kernel.org,m:atomlin@atomlin.com,m:chleroy@kernel.org,m:nsc@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:xiujianfeng@huawei.com,m:f.gruenbichler@proxmox.com,m:arnout@bzzt.net,m:mattia@mapreri.org,m:kpcyrd@archlinux.org,m:christian@heusel.eu,m:mcaju95@gmail.com,m:bigeasy@linutronix.de,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-integrity@vger.kerne
 l.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,huawei.com,oracle.com,linux.dev,atomlin.com,oss.cyber.gouv.fr,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 11F39968E6
X-Rspamd-Action: no action

On 1/13/26 1:28 PM, Thomas Weißschuh wrote:
> The logic to extract the signature bits from a module file are
> duplicated between the module core and IMA modsig appraisal.
> 
> Unify the implementation.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  include/linux/module_signature.h    |  4 +--
>  kernel/module/signing.c             | 52 +++++++------------------------------
>  kernel/module_signature.c           | 41 +++++++++++++++++++++++++++--
>  security/integrity/ima/ima_modsig.c | 24 ++++-------------
>  4 files changed, 56 insertions(+), 65 deletions(-)
> 
> diff --git a/include/linux/module_signature.h b/include/linux/module_signature.h
> index 7eb4b00381ac..186a55effa30 100644
> --- a/include/linux/module_signature.h
> +++ b/include/linux/module_signature.h
> @@ -40,7 +40,7 @@ struct module_signature {
>  	__be32	sig_len;	/* Length of signature data */
>  };
>  
> -int mod_check_sig(const struct module_signature *ms, size_t file_len,
> -		  const char *name);
> +int mod_split_sig(const void *buf, size_t *buf_len, bool mangled,
> +		  size_t *sig_len, const u8 **sig, const char *name);
>  
>  #endif /* _LINUX_MODULE_SIGNATURE_H */
> diff --git a/kernel/module/signing.c b/kernel/module/signing.c
> index fe3f51ac6199..6d64c0d18d0a 100644
> --- a/kernel/module/signing.c
> +++ b/kernel/module/signing.c
> @@ -37,54 +37,22 @@ void set_module_sig_enforced(void)
>  	sig_enforce = true;
>  }
>  
> -/*
> - * Verify the signature on a module.
> - */
> -static int mod_verify_sig(const void *mod, struct load_info *info)
> -{
> -	struct module_signature ms;
> -	size_t sig_len, modlen = info->len;
> -	int ret;
> -
> -	pr_devel("==>%s(,%zu)\n", __func__, modlen);
> -
> -	if (modlen <= sizeof(ms))
> -		return -EBADMSG;
> -
> -	memcpy(&ms, mod + (modlen - sizeof(ms)), sizeof(ms));
> -
> -	ret = mod_check_sig(&ms, modlen, "module");
> -	if (ret)
> -		return ret;
> -
> -	sig_len = be32_to_cpu(ms.sig_len);
> -	modlen -= sig_len + sizeof(ms);
> -	info->len = modlen;
> -
> -	return verify_pkcs7_signature(mod, modlen, mod + modlen, sig_len,
> -				      VERIFY_USE_SECONDARY_KEYRING,
> -				      VERIFYING_MODULE_SIGNATURE,
> -				      NULL, NULL);
> -}
> -
>  int module_sig_check(struct load_info *info, int flags)
>  {
> -	int err = -ENODATA;
> -	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
> +	int err;
>  	const char *reason;
>  	const void *mod = info->hdr;
> +	size_t sig_len;
> +	const u8 *sig;
>  	bool mangled_module = flags & (MODULE_INIT_IGNORE_MODVERSIONS |
>  				       MODULE_INIT_IGNORE_VERMAGIC);
> -	/*
> -	 * Do not allow mangled modules as a module with version information
> -	 * removed is no longer the module that was signed.
> -	 */
> -	if (!mangled_module &&
> -	    info->len > markerlen &&
> -	    memcmp(mod + info->len - markerlen, MODULE_SIG_STRING, markerlen) == 0) {
> -		/* We truncate the module to discard the signature */
> -		info->len -= markerlen;
> -		err = mod_verify_sig(mod, info);
> +
> +	err = mod_split_sig(info->hdr, &info->len, mangled_module, &sig_len, &sig, "module");
> +	if (!err) {
> +		err = verify_pkcs7_signature(mod, info->len, sig, sig_len,
> +					     VERIFY_USE_SECONDARY_KEYRING,
> +					     VERIFYING_MODULE_SIGNATURE,
> +					     NULL, NULL);
>  		if (!err) {
>  			info->sig_ok = true;
>  			return 0;

The patch looks to modify the behavior when mangled_module is true.

Previously, module_sig_check() didn't attempt to extract the signature
in such a case and treated the module as unsigned. The err remained set
to -ENODATA and the function subsequently consulted module_sig_check()
and security_locked_down() to determine an appropriate result.

Newly, module_sig_check() calls mod_split_sig(), which skips the
extraction of the marker ("~Module signature appended~\n") from the end
of the module and instead attempts to read it as an actual
module_signature. The value is then passed to mod_check_sig() which
should return -EBADMSG. The error is propagated to module_sig_check()
and treated as fatal, without consulting module_sig_check() and
security_locked_down().

I think the mangled_module flag should not be passed to mod_split_sig()
and it should be handled solely by module_sig_check().

> diff --git a/kernel/module_signature.c b/kernel/module_signature.c
> index 00132d12487c..b2384a73524c 100644
> --- a/kernel/module_signature.c
> +++ b/kernel/module_signature.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/errno.h>
>  #include <linux/printk.h>
> +#include <linux/string.h>
>  #include <linux/module_signature.h>
>  #include <asm/byteorder.h>
>  
> @@ -18,8 +19,8 @@
>   * @file_len:	Size of the file to which @ms is appended.
>   * @name:	What is being checked. Used for error messages.
>   */
> -int mod_check_sig(const struct module_signature *ms, size_t file_len,
> -		  const char *name)
> +static int mod_check_sig(const struct module_signature *ms, size_t file_len,
> +			 const char *name)
>  {
>  	if (be32_to_cpu(ms->sig_len) >= file_len - sizeof(*ms))
>  		return -EBADMSG;
> @@ -44,3 +45,39 @@ int mod_check_sig(const struct module_signature *ms, size_t file_len,
>  
>  	return 0;
>  }
> +
> +int mod_split_sig(const void *buf, size_t *buf_len, bool mangled,
> +		  size_t *sig_len, const u8 **sig, const char *name)
> +{
> +	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
> +	struct module_signature ms;
> +	size_t modlen = *buf_len;
> +	int ret;
> +
> +	/*
> +	 * Do not allow mangled modules as a module with version information
> +	 * removed is no longer the module that was signed.
> +	 */
> +	if (!mangled &&
> +	    *buf_len > markerlen &&
> +	    memcmp(buf + modlen - markerlen, MODULE_SIG_STRING, markerlen) == 0) {
> +		/* We truncate the module to discard the signature */
> +		modlen -= markerlen;
> +	}
> +
> +	if (modlen <= sizeof(ms))
> +		return -EBADMSG;
> +
> +	memcpy(&ms, buf + (modlen - sizeof(ms)), sizeof(ms));
> +
> +	ret = mod_check_sig(&ms, modlen, name);
> +	if (ret)
> +		return ret;
> +
> +	*sig_len = be32_to_cpu(ms.sig_len);
> +	modlen -= *sig_len + sizeof(ms);
> +	*buf_len = modlen;
> +	*sig = buf + modlen;
> +
> +	return 0;
> +}
> diff --git a/security/integrity/ima/ima_modsig.c b/security/integrity/ima/ima_modsig.c
> index 3265d744d5ce..a57342d39b07 100644
> --- a/security/integrity/ima/ima_modsig.c
> +++ b/security/integrity/ima/ima_modsig.c
> @@ -40,44 +40,30 @@ struct modsig {
>  int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
>  		    struct modsig **modsig)
>  {
> -	const size_t marker_len = strlen(MODULE_SIG_STRING);
> -	const struct module_signature *sig;
> +	size_t buf_len_sz = buf_len;
>  	struct modsig *hdr;
>  	size_t sig_len;
> -	const void *p;
> +	const u8 *sig;
>  	int rc;
>  
> -	if (buf_len <= marker_len + sizeof(*sig))
> -		return -ENOENT;
> -
> -	p = buf + buf_len - marker_len;
> -	if (memcmp(p, MODULE_SIG_STRING, marker_len))
> -		return -ENOENT;
> -
> -	buf_len -= marker_len;
> -	sig = (const struct module_signature *)(p - sizeof(*sig));
> -
> -	rc = mod_check_sig(sig, buf_len, func_tokens[func]);
> +	rc = mod_split_sig(buf, &buf_len_sz, true, &sig_len, &sig, func_tokens[func]);

Passing mangled=true to mod_split_sig() seems incorrect here. It causes
that the function doesn't properly extract the signature marker at the
end of the module, no?

>  	if (rc)
>  		return rc;
>  
> -	sig_len = be32_to_cpu(sig->sig_len);
> -	buf_len -= sig_len + sizeof(*sig);
> -
>  	/* Allocate sig_len additional bytes to hold the raw PKCS#7 data. */
>  	hdr = kzalloc(struct_size(hdr, raw_pkcs7, sig_len), GFP_KERNEL);
>  	if (!hdr)
>  		return -ENOMEM;
>  
>  	hdr->raw_pkcs7_len = sig_len;
> -	hdr->pkcs7_msg = pkcs7_parse_message(buf + buf_len, sig_len);
> +	hdr->pkcs7_msg = pkcs7_parse_message(sig, sig_len);
>  	if (IS_ERR(hdr->pkcs7_msg)) {
>  		rc = PTR_ERR(hdr->pkcs7_msg);
>  		kfree(hdr);
>  		return rc;
>  	}
>  
> -	memcpy(hdr->raw_pkcs7, buf + buf_len, sig_len);
> +	memcpy(hdr->raw_pkcs7, sig, sig_len);
>  
>  	/* We don't know the hash algorithm yet. */
>  	hdr->hash_algo = HASH_ALGO__LAST;
> 

-- 
Thanks,
Petr

