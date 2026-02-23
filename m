Return-Path: <linuxppc-dev+bounces-17039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPR0JqEonGl1AAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 11:14:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B7B174ABA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 11:14:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKGtg4NDdz2yFc;
	Mon, 23 Feb 2026 21:14:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771841691;
	cv=none; b=fxTQqYDCoQg+9hZ5WcBEHFJ4BfdOyBwPeKO9BgdKkMR9edwowP31DDiQ18XBfMvOjKB/5P/o0YY2mnKfcZOZ2PzecxECkayLpLCEaYQ6oUCaiwVtDPK8BcWmGzl3uyhVeLoyGrFBAzHNd+wBwTDnsIQ50awRIRvFuRzUiGYicvdF0xbuSzyO1SUIN0mI6UfcXSs61BBs5AGzb/HixOSQce0/hkMc4k60agZHsxfat1i6IFb+XEY6N9g+noUNIjcYWwZgRw9Dvx87TgFwr7hAbIQk6t1sefUkY8+1eC22yWxYdCV2ECEu/eo2Fh2ZIzLl7DhGEzjsxSbWLcnV1xTx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771841691; c=relaxed/relaxed;
	bh=iYufON41haCPAAlB17VyKfqSryTL2wR1KeTBsoMTWuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvgRq+mcMcJM2EmCYQmVue0yZuhISgW1rQgSdMTke6WKhhnFm0WqOYEXdLqzMgSZW6S2+SMPNOksINObK6d5jrqmcuBd/RI53SNrpvogfGdin/pWE8W0PdhigCSzrhEflszvuWJW14tAsPtGOZPSSznLYVUX2tedb6DF5OXxCsbOjJXnOuufayfHcYdKLoq0xSfQ2i+5wwp+/x+UEOWX/vUNnAaDw2gOBt50dOkGWIgi7kSmvp4U04eJEgoJoCWwd/4DX12oOufGndsDRqpZC2a33c8YQsdDqQ+Z0JmnXkuMq6dyJy0AMwjLamVc/5athwomxL0PkV+F9B3kvpSCbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.169; helo=mail-vk1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.169; helo=mail-vk1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKGtd5BZmz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 21:14:48 +1100 (AEDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5663724e4daso4086302e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 02:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841686; x=1772446486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYufON41haCPAAlB17VyKfqSryTL2wR1KeTBsoMTWuQ=;
        b=sJbJuP1c6fzkxb2/Owt55BHJI6Abmn1CtCaJ9/bCB3T5XrAbkgTkiso5reoaHzzRTz
         WKSMlVv2ZRr7/2n5aeOx7EtqKYk/imBwHagzHBKMo4wXXYRaWeC2BgsGr4CY7P8eDWXK
         hxuiAEw1QsAjKmZLLJEouHcAPTjmEZaZzviBk9ULz0Di8XQMCOOfbywQeYJxqM0rYhnp
         wpSu/Dzht7xf6zbDE/dUVGJnyfMlAT0AJtGOiNjrGlI6DPoAjBO0wFluFP5OElk6vJz9
         SeVuK8hrCOmbYWBVBFZzs1E4hll1Wi9BSGuwrvNYrGJfLgPkU+Q64nIzsT8Y5nRjmLke
         EDKw==
X-Forwarded-Encrypted: i=1; AJvYcCVgQihK8KzlQv0Bo/Mo251RGE3fG64k+KWuqdwkrJq2clQQPUQG7D0njg9v3ijt0PeWt3WUrK0ZOS50hCg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsybkQtVCjy7cN28JK0cJv4OsLweXwl9SGHoBkJzMXAIWoo1qk
	VUU3qcTf9wKbxFSVv9vfkuxZqiKZQgXIUE3DPcGo755bdb2WeDbaotlWi9DguI7x
X-Gm-Gg: AZuq6aJ+WoOO9ewY02K7XARjcihWHvvXiXJV4XfXi/x8IlD9HK5HgeuKxDxVYRhUbG9
	dnCMhnXu9FFbHhvgdHk0UJOQUg7slIxcUCLC0zaLwdxp7ULVLleFy2IjclG3GIMODgoGkVuvd4G
	u5JZTUyq0G9NFhzqqMoj4nVaLuNLUT9TdCjWdBlKdBa9sQt4CuMkbbWFLJddpbA4tFGwH7QzWE1
	s1EBeAtB706trshVqN01DKyWARK2oSgtN2maiIJpUwg7rtB38c5O7A1k4uX/HZgCrOc7FZN4S4h
	O2t5SeLqqu2mPSCr+yqwGhlPeia8nqDb7NVeSFrXsUfnYZSlWPR82h1UfdNhPIbUzgHnb+nxnOt
	RFs5WTQY+Ey+HkckQ6kdRtwDHwmzojCNzkmv4qKWlMKvKA0YZXfeSBI3ZH0Z1+EHmhkYNf1A12c
	5wXThyLaPiN1Deblc1QwqjV7F4wRkXeJGjmABYw1bBeVhzJnhZ0sulASnOwSTIoNWD
X-Received: by 2002:a05:6122:169c:b0:566:cd52:313d with SMTP id 71dfb90a1353d-568e48bfc0fmr3756567e0c.16.1771841685889;
        Mon, 23 Feb 2026 02:14:45 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e58fe3cbsm8257042e0c.13.2026.02.23.02.14.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 02:14:45 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5663724e4daso4086293e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 02:14:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWud834f9mwXettPQuzMe4CoF5So/FPrwSSCuRb/zkbtbjvx0VxDzK74PPFkitVwQVwRiDJbJ/DPT0BM1A=@lists.ozlabs.org
X-Received: by 2002:a05:6102:38d3:b0:5fd:8175:2eb7 with SMTP id
 ada2fe7eead31-5feb30db471mr4509289137.34.1771841684922; Mon, 23 Feb 2026
 02:14:44 -0800 (PST)
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
References: <20260217212707.2450423-11-cassel@kernel.org> <20260217212707.2450423-12-cassel@kernel.org>
 <aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810> <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
In-Reply-To: <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 11:14:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
X-Gm-Features: AaiRm52HvurLndDwor1bgpbfCcI9wH1Ckd1tYC4oQp0RsW6za3e41CkVlZ_fe6s
Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
Subject: Re: [PATCH 1/9] PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den <den@valinux.co.jp>, 
	Damien Le Moal <dlemoal@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17039-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,google.com,intel.com,gmail.com,nvidia.com,socionext.com,renesas.com,glider.be,valinux.co.jp,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:mmaddireddy@nvidia.com,m:Frank.li@nxp.com,m:cassel@kernel.org,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:srikanth.thokala@intel.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kishon@kernel.org,m:den@valinux.co.jp,m:dlemoal@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:thierryreding@gmail.com,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nvidia.com:email,mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 10B7B174ABA
X-Rspamd-Action: no action

Hi Manikanta,

On Mon, 23 Feb 2026 at 04:57, Manikanta Maddireddy
<mmaddireddy@nvidia.com> wrote:
> On 18/02/26 3:27 am, Frank Li wrote:
>
> On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
>
> Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate
> BAR_64BIT_UPPER from BAR_RESERVED.
>
> This BAR type will only be used for a BAR following a "only_64bit" BAR.
>
> This makes the BAR description more clear, and the reader does no longer
> need to check the BAR type for the preceding BAR to know how to interpret
> the BAR type.
>
> No functional changes.
>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>

[...]

Please do not send HTML emails to the list, as they are rejected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

