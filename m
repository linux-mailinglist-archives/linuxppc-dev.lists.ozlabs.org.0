Return-Path: <linuxppc-dev+bounces-17363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E8ODgJNoWkfsAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 08:51:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176A1B41AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 08:51:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMgWK1HPRz2xMt;
	Fri, 27 Feb 2026 18:51:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772178685;
	cv=none; b=Z6CjwGeUiyCzzXTsrhzRVl9Nad1cZ4SKE9iuYlJk4FWpeo/GUUQrHoIje3HRoW7P4rgzTYvxONHRtUR9XK9mBwg0c5cC4n04KhSFd6BbQ/EJRTeJS3gsOrdU08r8+Gyv10c+KUKmRZPNqtokpaLb1KTek3FLeprKR04zZ3c3Lagahkl23wT2sCH5guS2yI0DE1iPvlaHiwVrmjoH9rZRlPAyXcfu/mRIPy0edaj64ZaM2TcIj5RM7bLGCGe6WSix/NLghINitPvKk69VPLZeG6dE3USGN4/2WPvHEsrH+V5nucWv4AoCc0NVvKjafpsm1UU/7GzZGPyLChsfWvR2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772178685; c=relaxed/relaxed;
	bh=ONLCnHFNRtJkpxerUuAuuCzsQ8hq9429WA4aHg6YYaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6b36DN8dDplvvq6mCoD4nVwOT1d0J6qHk201/i4qLFE2a9wds9IiX+oQkYMqthdHSH4lS+7yPu+gOWovEobnbfFpNTpHLdOXLxquBxp3gQOuY/htc0aIspSLDufkuPr/eOfTljSK/P5PiGclZB2Gnmcv/LyVIgPsLX20orKTvmEu3MFCFXNIAslfb2t0eX0Mr5L5OAd9RY+zRru5fLjY39dfultvXB2b7ZdxSfn2rL2+hoSDlA2Avn/fhLiP2u+VBpFll2S9OVfRYdjMxbG3CbZIhB+y2RgHJeK2XlaMijzyilEqa7pSHZ1kkhdxhkMHBBFwrdciQbAw5gUWyFHrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mnJR1Ri0; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mnJR1Ri0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMgWJ21X2z2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 18:51:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6CAF407D9;
	Fri, 27 Feb 2026 07:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0F4C116C6;
	Fri, 27 Feb 2026 07:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772178681;
	bh=FuwJ4dFEMoOWUXSsbBn5R1/MzLKf04Ey3jVnqdyvQaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mnJR1Ri0HlkV4Dai35gEyErjrdRIBpO4AcgWYMZ32L/4AGLK5MBEWxqmkTaZ318N5
	 pB7otq2jdQRQV1+qztqAs9fehuvEo9GgL0FoEw2Cht9wEXi2gUbi/U54aeB3C9nMad
	 5az7xMleO+ONHOEwNTW90zNb9vJ5fkCtOleepZjN96Irept03ErO8dGTgSAdNbDrc+
	 QSUyNhDg4W7+2/GL4RJ9jdI9N5xbD3YM7wKB9d4r26aDN1fyzsjE1eV1tEcQyHPIs3
	 mNOilMCYGlXI3qJ6g4zThYMdKBtv1LA7MZauVX1rewLA+k2y8mhK/0LXxGpxfmxuWw
	 juPlTGhSjEPCg==
Message-ID: <31dfcf7a-5b3d-406d-bdd4-c8b09f7eb1f0@kernel.org>
Date: Fri, 27 Feb 2026 08:51:15 +0100
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
Subject: Re: [PATCH v6 0/6] Extend "trusted" keys to support a new trust
 source named the PowerVM Key Wrapping Module (PKWM)
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
 keyrings@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 James.Bottomley@HansenPartnership.com, jarkko@kernel.org,
 zohar@linux.ibm.com, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
References: <20260201135930.898721-1-ssrish@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260201135930.898721-1-ssrish@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17363-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,HansenPartnership.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:ssrish@linux.ibm.com,m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5176A1B41AC
X-Rspamd-Action: no action



Le 01/02/2026 à 14:59, Srish Srinivasan a écrit :
> Power11 has introduced a feature called the PowerVM Key Wrapping Module
> (PKWM), where PowerVM in combination with Power LPAR Platform KeyStore
> (PLPKS) [1] supports a new feature called "Key Wrapping" [2] to protect
> user secrets by wrapping them using a hypervisor generated wrapping key.
> This wrapping key is an AES-GCM-256 symmetric key that is stored as an
> object in the PLPKS. It has policy based protections that prevents it from
> being read out or exposed to the user. This wrapping key can then be used
> by the OS to wrap or unwrap secrets via hypervisor calls.
> 
> This patchset intends to add the PKWM, which is a combination of IBM
> PowerVM and PLPKS, as a new trust source for trusted keys. The wrapping key
> does not exist by default and its generation is requested by the kernel at
> the time of PKWM initialization. This key is then persisted by the PKWM and
> is used for wrapping any kernel provided key, and is never exposed to the
> user. The kernel is aware of only the label to this wrapping key.
> 
> Along with the PKWM implementation, this patchset includes two preparatory
> patches: one fixing the kernel-doc inconsistencies in the PLPKS code and
> another reorganizing PLPKS config variables in the sysfs.
> 
> Changelog:
> 
> v6:

Seems like v5 was applied, if needed can you send followup patch ?

Christophe

> 
> * Patch 1 to Patch 3:
>    - Add Nayna's Tested-by tag
> * Patch 4
>    - Fix build error reported by kernel test robot <lkp@intel.com>
>    - Add Nayna's Tested-by tag
> * Patch 5
>    - Add Nayna's Tested-by tag
> 
> v5:
> 
> * Patch 1 to Patch 3:
>    - Add Nayna's Reviewed-by tag
> * Patch 4:
>    - Fix build error identified by chleroy@kernel.org
>    - Add Nayna's Reviewed-by tag
> * Patch 5:
>    - Add Reviewed-by tags from Nayna and Jarkko
> 
> v4:
> 
> * Patch 5:
>    - Add a per-backend private data pointer in trusted_key_options
>      to store a pointer to the backend-specific options structure
>    - Minor clean-up
> 
> v3:
> 
> * Patch 2:
>    - Add Mimi's Reviewed-by tag
> * Patch 4:
>    - Minor tweaks to some print statements
>    - Fix typos
> * Patch 5:
>    - Fix typos
>    - Add Mimi's Reviewed-by tag
> * Patch 6:
>    - Add Mimi's Reviewed-by tag
> 
> v2:
> 
> * Patch 2:
>    - Fix build warning detected by the kernel test bot
> * Patch 5:
>    - Use pr_debug inside dump_options
>    - Replace policyhande with wrap_flags inside dump_options
>    - Provide meaningful error messages with error codes
> 
> Nayna Jain (1):
>    docs: trusted-encryped: add PKWM as a new trust source
> 
> Srish Srinivasan (5):
>    pseries/plpks: fix kernel-doc comment inconsistencies
>    powerpc/pseries: move the PLPKS config inside its own sysfs directory
>    pseries/plpks: expose PowerVM wrapping features via the sysfs
>    pseries/plpks: add HCALLs for PowerVM Key Wrapping Module
>    keys/trusted_keys: establish PKWM as a trusted source
> 
>   .../ABI/testing/sysfs-firmware-plpks          |  58 ++
>   Documentation/ABI/testing/sysfs-secvar        |  65 --
>   .../admin-guide/kernel-parameters.txt         |   1 +
>   Documentation/arch/powerpc/papr_hcalls.rst    |  43 ++
>   .../security/keys/trusted-encrypted.rst       |  50 ++
>   MAINTAINERS                                   |   9 +
>   arch/powerpc/include/asm/hvcall.h             |   4 +-
>   arch/powerpc/include/asm/plpks.h              |  95 +--
>   arch/powerpc/include/asm/secvar.h             |   1 -
>   arch/powerpc/kernel/secvar-sysfs.c            |  21 +-
>   arch/powerpc/platforms/pseries/Makefile       |   2 +-
>   arch/powerpc/platforms/pseries/plpks-secvar.c |  29 -
>   arch/powerpc/platforms/pseries/plpks-sysfs.c  |  96 +++
>   arch/powerpc/platforms/pseries/plpks.c        | 688 +++++++++++++++++-
>   include/keys/trusted-type.h                   |   7 +-
>   include/keys/trusted_pkwm.h                   |  33 +
>   security/keys/trusted-keys/Kconfig            |   8 +
>   security/keys/trusted-keys/Makefile           |   2 +
>   security/keys/trusted-keys/trusted_core.c     |   6 +-
>   security/keys/trusted-keys/trusted_pkwm.c     | 190 +++++
>   20 files changed, 1207 insertions(+), 201 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-firmware-plpks
>   create mode 100644 arch/powerpc/platforms/pseries/plpks-sysfs.c
>   create mode 100644 include/keys/trusted_pkwm.h
>   create mode 100644 security/keys/trusted-keys/trusted_pkwm.c
> 


