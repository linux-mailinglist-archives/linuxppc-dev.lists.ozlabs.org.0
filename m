Return-Path: <linuxppc-dev+bounces-17530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NQBCZyCpWltCwYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 13:29:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBD81D868D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 13:29:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPdXR4n7yz3bmc;
	Mon, 02 Mar 2026 23:29:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=109.230.236.95
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772454551;
	cv=none; b=j+r6Vxuh1c7jGdcgk1S+ULCLkRGEqoWOpcMYkwBqAYIG02NEaMque5DUbQcuCM0gLt9ONMnn5PssQbm+VDVNnRWh2MTcY8heAhDK2P0jpwaaiLzrs9OgU32hc9bmnmDTXokbDnTD7r7nKPUGPSfVGvA0WBws78Cz7cgOiXM8sNnf6SOlvh1YE9iMu+9P0pHxqMtRsn9VQC6SV/aKLXJOK+tSas7nkggUKW6tOUoMQ6emFIR6/dDiaaeR03/kqxf/0+4PE8SXcxfAqouwp/u7/KkthUBRKA9jOG6dnxM8QaGr/4zhCU92EudyfBh/ZzftEPfjb2KAqmdrSZutfA/SDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772454551; c=relaxed/relaxed;
	bh=X8mwUNYwU9JF40bR4iD2R82JNIOFzCxZ7NUOwk/BDMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Df2bMdQq+d6v0Jhcn8UimtTjzeIKYQatLBZnvN2ZOTsnGOqqoB+tVjqDJ3FvPzBa8bJXkqr2C8JAglwG4U+AZzsArHZdJTDPEaECo6BAGA/9BMgGEUAgxAtiNDl2Qh8bu4VpZUgvJZtNMRzLN1+ycdaKxJfD7mt4skPVCdNnR6EQdC3V1oUKIZCcK09aVDihP+6AsE7Zk+NUXIHQn0LaxiEm3SF1OWHkInBlR++0i35FdWCaPwaSgTbnJmn9h2hwg7/rmKnzRQRRJ0PEi9cF4crqFM14KZpK++qYR+bQXfFOltTS1wf2auuMa4HZ9leq7wWDFT/LndV0nw/n5fyE9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ralfj.de; dkim=pass (1024-bit key; secure) header.d=ralfj.de header.i=@ralfj.de header.a=rsa-sha256 header.s=mail header.b=BCOnjU22; dkim-atps=neutral; spf=pass (client-ip=109.230.236.95; helo=r-passerv.ralfj.de; envelope-from=post@ralfj.de; receiver=lists.ozlabs.org) smtp.mailfrom=ralfj.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ralfj.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=ralfj.de header.i=@ralfj.de header.a=rsa-sha256 header.s=mail header.b=BCOnjU22;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ralfj.de (client-ip=109.230.236.95; helo=r-passerv.ralfj.de; envelope-from=post@ralfj.de; receiver=lists.ozlabs.org)
Received: from r-passerv.ralfj.de (r-passerv.ralfj.de [109.230.236.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPdXP2s7Qz3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 23:29:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ralfj.de; s=mail;
	t=1772454536; bh=esTLKb+WUSLP+AsKnFLMgNAf+diFPkDDjV0Pd6WW1/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BCOnjU22b/jdLSEp9fI4ZXsYJIYsFRiLCHfZrQ7spHnfClt7sp1JELo970f4LgOol
	 JnQ8VD6EkHCcT/ZDfQjEL+kWWTE8+JDW0z0DlBZeSA6YN15Jr7mj8S2uErEFix8yes
	 juIvP/O56YjynhkqGGgznD9455bI65Gxauk+JHPQ=
Received: from [IPV6:2001:67c:10ec:5784:8000::12e7] (2001-67c-10ec-5784-8000--12e7.net6.ethz.ch [IPv6:2001:67c:10ec:5784:8000::12e7])
	by r-passerv.ralfj.de (Postfix) with ESMTPSA id 9A52A2053392;
	Mon,  2 Mar 2026 13:28:55 +0100 (CET)
Message-ID: <fa775d83-73ad-450d-a592-7a9d3a3e2271@ralfj.de>
Date: Mon, 2 Mar 2026 13:28:50 +0100
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
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: Alice Ryhl <aliceryhl@google.com>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Jubilee Young <workingjubilee@gmail.com>, Matthew Maurer
 <mmaurer@google.com>, David Wood <david@davidtw.co>,
 Wesley Wiser <wwiser@gmail.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
 <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de>
 <aaUlwfP72ZpshLPL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aaU8VC-kLOKDyYDP@google.com>
From: Ralf Jung <post@ralfj.de>
Content-Language: en-US, de-DE
In-Reply-To: <aaU8VC-kLOKDyYDP@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ralfj.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:mkchauras@gmail.com,m:miguel.ojeda.sandonis@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:workingjubilee@gmail.com,m:mmaurer@google.com,m:david@davidtw.co,m:wwiser@gmail.com,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ralfj.de];
	FREEMAIL_TO(0.00)[google.com,gmail.com];
	FORGED_SENDER(0.00)[post@ralfj.de,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-17530-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ralfj.de:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[post@ralfj.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org,google.com,davidtw.co];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,rust-lang.org:url]
X-Rspamd-Queue-Id: 3CBD81D868D
X-Rspamd-Action: no action

Hi all,

On 02.03.26 08:29, Alice Ryhl wrote:
> On Mon, Mar 02, 2026 at 11:25:54AM +0530, Mukesh Kumar Chaurasiya wrote:
>> On Tue, Feb 24, 2026 at 09:58:10AM +0100, Ralf Jung wrote:
>>> Hi all,
>>>
>>> On 23.02.26 16:31, Miguel Ojeda wrote:
>>>> On Mon, Feb 23, 2026 at 3:26 AM Mukesh Kumar Chaurasiya
>>>> <mkchauras@gmail.com> wrote:
>>>>>
>>>>> I think, disabling altivec, fpu and vsx with compiler flag will work.
>>>>>
>>>>> What are your opinion on this?
>>>>
>>>> It is really up to upstream Rust -- for us, i.e. the kernel, it
>>>> usually doesn't really matter much how things like that are
>>>> accomplished: whether via flags, a built-in target, a custom target,
>>>> etc. However, we need to know what the path to stability is.
>>>>
>>>> My understanding (but I may be wrong) is that upstream Rust prefer we
>>>> use built-in targets for softfloat instead of disabling via
>>>> `-Ctarget-feature` (and that the other options may go away soon and/or
>>>> will never be stable) -- at least for some cases. For instance, for
>>>> arm64, please this recent change kernel-side regarding `neon` as an
>>>> entry point:
>>>>
>>>>     446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfloat target")
>>>>
>>>> So please ask upstream Rust (probably in their Zulip, e.g. in
>>>> t-compiler or rust-for-linux channels) what you should do for powerpc.
>>>> They will likely be happy with a PR adding the target (or whatever
>>>> they decide) as Alice mentions. And until we reach that minimum
>>>> version (in a year or more), we can use something else meanwhile. But
>>>> at least we will have a way towards the end goal, if that makes sense.
>>>>
>>>> In case it helps, let me Cc Ralf, Jubilee and Matthew who were
>>>> involved in some of that discussion in the past, plus the compiler
>>>> leads.
>>>
>>> Upstream Rust dev here. Indeed we'd strongly prefer if this could use a
>>> built-in Rust target; we can work with you on adding a new target if that is
>>> needed.
>>> The kernel currently uses a custom JSON target on x86 and that's quite the
>>> headache for compiler development: JSON targets are highly unstable and
>>> directly expose low-level details of how the compiler internally represents
>>> targets. When we change that representation, we update all built-in targets,
>>> but of course we cannot update JSON targets. So whenever possible we'd like
>>> to move towards reducing the number of JSON targets used by the kernel, not
>>> increase it. :)
>>>
>>> Kind regards,
>>> Ralf
>>>
>> Hey,
>>
>> Sorry for delayed response. I was out of network zone.
>>
>> I am not sure about the process of how to get this in rust toolchain.
>> Should I raise an issue of github for this?
> 
> You would need to add a new file to compiler/rustc_target/src/spec/targets
> in the rustc repository.
> 
> If you're not sure what to put there, I would suggest coming up with
> something that looks plausible, and opening a PR with that. Then others
> can help you with filling out the target correctly.

Also see the documentation at 
<https://doc.rust-lang.org/rustc/target-tier-policy.html#adding-a-new-target>.

Kind regards,
Ralf


