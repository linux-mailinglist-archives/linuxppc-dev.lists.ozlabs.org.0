Return-Path: <linuxppc-dev+bounces-8592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC3DAB744E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 20:25:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyMGf33LVz2xS9;
	Thu, 15 May 2025 04:25:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747247146;
	cv=none; b=RnoTkhXW5s07Y11jBqb2UL7w3xSKt3ygeQkdXsoK1NFUCAsKqgjk0gZQDGH+HvrPv8axnreIJe17DUQfJ1QnbtoWJ7/sPuyzpbvs1LbkwM77uIGln9hX958mP2SY6spNYJIMrAkmh4qBlwHgp0fRFkU3HbmriIdA5GoX6u0EFe7SZ8ieirQ2dfXl+Cz7itm0N5k5J+8hvFOJICTxkCzee+ud7enkkjcaeFgB1MsPCMVKH/+WB2mIbb2Zp50Z2XDhrHR8I7ibPyRMX9YmcFAfmELe47BXtCFIdmaHTscKHTFXAr58deIqiNcW+qIQy2f6WalDArQ3YuHb9abGfCzrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747247146; c=relaxed/relaxed;
	bh=Sk6K50SJwRVBX41TpMia1ozjSbtn+RFQ/xSJZ1d8+m0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Rkb94+fh9EarnrttRYLowaHoWgUe3qeCXs6j7DRbHddBd1YqSpDjIpARkPKLT0uz9qEgvPE0Sl4gKSE8JJCFuIBIQ5oIOsOL1FSBR8EJLM+CmC439ozygvPkJXUp6pZB1mHzGwGynpJ7TBwKkfFpZcCxmIQGg55N0VaWEXyzRhHvsPaTL/eznKtGyadyJylLXIiChFkYKLiOif6XU0qY4pLpKUCV7lrToR+Si/86wL55WddJYoXszWWx+XJg64Yajb4Jp5ZJqASUuWB6SJzdz9X1Wa8DMXMhgaCXhHzoRGidcgGiHm7I5+khP6kRVpkSeNfXKCNypkvmc9lJQjAj9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=sr0OtqzI; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=sr0OtqzI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyMGb5fxcz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 04:25:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747247137;
	bh=Sk6K50SJwRVBX41TpMia1ozjSbtn+RFQ/xSJZ1d8+m0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=sr0OtqzImkjWIiWULL7qcXg/qcMho0hs2xaNucwcAreBWQ2E45Z4IIQOyS+7+B/9Z
	 wMiLLhMsWTW9FAwOJzQDW7ieAtsPf/Rs2zUIKJPVF3ajqcQxESgMoxyM8ON+2GcBW1
	 L8qZcUsSGEIr4hfmDvc1N8xI98e0pDP4tIuKtUls=
Date: Wed, 14 May 2025 20:25:34 +0200 (GMT+02:00)
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>,
	Arnout Engelen <arnout@bzzt.net>,
	Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
	Christian Heusel <christian@heusel.eu>,
	=?UTF-8?Q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Message-ID: <17aaa56b-5ee7-4a7f-a3c1-206e2114645d@weissschuh.net>
In-Reply-To: <edeb23e7884e94006d560898b7f9d2dd257a275e.camel@linux.ibm.com>
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net> <20250429-module-hashes-v3-2-00e9258def9e@weissschuh.net> <10ca077d6d51fac10e56c94db4205a482946d15f.camel@linux.ibm.com> <edeb23e7884e94006d560898b7f9d2dd257a275e.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/9] ima: efi: Drop unnecessary check for
 CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <17aaa56b-5ee7-4a7f-a3c1-206e2114645d@weissschuh.net>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

May 14, 2025 19:39:37 Mimi Zohar <zohar@linux.ibm.com>:

> On Wed, 2025-05-14 at 11:09 -0400, Mimi Zohar wrote:
>> On Tue, 2025-04-29 at 15:04 +0200, Thomas Wei=C3=9Fschuh wrote:
>>> When configuration settings are disabled the guarded functions are
>>> defined as empty stubs, so the check is unnecessary.
>>> The specific configuration option for set_module_sig_enforced() is
>>> about to change and removing the checks avoids some later churn.
>>>
>>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>>
>>> ---
>>> This patch is not strictly necessary right now, but makes looking for
>>> usages of CONFIG_MODULE_SIG easier.
>>> ---
>>> =C2=A0security/integrity/ima/ima_efi.c | 6 ++----
>>> =C2=A01 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/security/integrity/ima/ima_efi.c b/security/integrity/ima/=
ima_efi.c
>>> index
>>> 138029bfcce1e40ef37700c15e30909f6e9b4f2d..a35dd166ad47beb4a7d46cc3e8fc6=
04f57e03ecb
>>> 100644
>>> --- a/security/integrity/ima/ima_efi.c
>>> +++ b/security/integrity/ima/ima_efi.c
>>> @@ -68,10 +68,8 @@ static const char * const sb_arch_rules[] =3D {
>>> =C2=A0const char * const *arch_get_ima_policy(void)
>>> =C2=A0{
>>> =C2=A0=C2=A0=C2=A0 if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_g=
et_secureboot()) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ENABLED(CONFIG_MODULE_SIG)=
)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_modul=
e_sig_enforced();
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ENABLED(CONFIG_KEXEC_SIG))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_kexec=
_sig_enforced();
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_module_sig_enforced();
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_kexec_sig_enforced();
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return sb_arch_rules;
>>
>> Hi Thomas,
>>
>> I'm just getting to looking at this patch set.=C2=A0 Sorry for the delay=
.
>>
>> Testing whether CONFIG_MODULE_SIG and CONFIG_KEXEC_SIG are configured gi=
ves priority
>> to them, rather than to the IMA support.=C2=A0 Without any other changes=
, both signature
>> verifications would be enforced.=C2=A0 Is that the intention?
>
> Never mind, got it.
>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

Thanks for the review!

Given that this series has no chance
of getting into the next merge window,
would it be possible to take the two IMA preparation patches
through the IMA tree to have them out of the way?


Thomas

