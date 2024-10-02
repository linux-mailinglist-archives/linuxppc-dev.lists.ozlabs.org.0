Return-Path: <linuxppc-dev+bounces-1722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FF198CF09
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 10:41:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJSw23d6vz2yN4;
	Wed,  2 Oct 2024 18:41:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727858496;
	cv=none; b=anCDkchZ1nQ2gScAsMAjosShSffwq7LjPeGUBl+KQ+TVKGPX4ukZOM+s7YQfuUIK0w5XUBWJyxdM3lrzyxRQfioEL+iPUDQvH6uQh5V/fegQK8bFuInrjAE6mtt7HKHABEAeGHfMUeEYvBKke0HfxVkBKmWZ+7JAKwRLztBC/Ph9tMGXJSCVxKAPcxsNXnBiSK5iXVLl5+If0pxH0BnhGyM09oNElLdsQ01WkvEsOeqqn3AXhW+QWB1DibCXjsQ/BhDP31wCZxYZILIAgd7Hmz0qSBfqhnC7AwNNniPHyCw8c48hBSfU6kYRrjoJS6IIQsXNP4NwnFmE46qKxCRw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727858496; c=relaxed/relaxed;
	bh=3C0G3O7yUy9ur5Y6JDJ87KZIBLP16PDJXXsStwR47lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6E8lEgLkH8PISQpLZt6P6PZYFnW+U7hG8VstZ9UJCS1gRPSca5ZhaRuWqYP/F8eFyX3E+eQFovUVqg7QO3WNPRedxCK6JVyOmEOFWM913qg404TZ8KHogEBPH0KrH6omgiKXxrftJFcVlLTXVSJkFBNDG3mmia27Jr4osN10cUZ0oEx8GjqAPbeZm47+LoiWDw66sLvjaoY+82rQxg2z4jIWDsmCSdX9OWWN+cOXlfKbJd0LiYwARrx9PaXK+TAxCpcG6L+6eIAqywBPDOKcmdYFz4SLlt9hsAiB4VjqtCHDXfbEFLs5kyTiOMf3G0ZbdQZWaD1/C62mk3TJxM0Ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJSvv0HW7z2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 18:41:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3C0G3O7yUy9ur5Y6JDJ87KZIBLP16PDJXXsStwR47lY=; b=Ace/cMNQVe0c6T9oh88YX/IbtV
	+ZPCwpY+9Dp83bSb2xRbhQsuaMeqT2rU0tfldxjT5TLhU5aMDOPEY+wYiU7cECRAYX7l0ZhA4SBgr
	dPSPm7OiA+My0hhscawIG5hgyMpSJDV+fu4LVSCqtx5DpQyEN5Zd9/QOxgPY8TiosQeMlVD5tKEkn
	38tR8qjvqM8r/vfBnha1BEfa+W/wkLIppXE29TT82bByfRPuWBMszxSRYohCLSDC83di0v/VPNbuh
	UVPnFzf8RL9Yb+t9rdsbeAxwLx2MR4dhYbTCTLFhFop7a7S5C8uMq2x996aO0zijG2Z7onXRKQghC
	eZG+38qw==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1svuvB-00000003RxD-06Jx;
	Wed, 02 Oct 2024 08:41:21 +0000
Message-ID: <afd78995-df29-45e8-8856-7645bd75cb6a@infradead.org>
Date: Wed, 2 Oct 2024 17:41:13 +0900
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ps3: Correct some typos in comments
To: Shen Lichuan <shenlichuan@vivo.com>, mpe@ellerman.id.au
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240930023234.7457-1-shenlichuan@vivo.com>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20240930023234.7457-1-shenlichuan@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 9/30/24 11:32, Shen Lichuan wrote:
> Fixed some confusing typos that were currently identified with codespell,
> the details are as follows:
> 
> -in the code comments:
> drivers/ps3/ps3-lpm.c:94: rigths ==> rights
> drivers/ps3/ps3-sys-manager.c:365: acnowledge ==> acknowledge
> drivers/ps3/ps3-vuart.c:470: remaning ==> remaining
> drivers/ps3/ps3-vuart.c:471: transmision ==> transmission
> drivers/ps3/sys-manager-core.c:15: Staticly ==> Statically
> 
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Looks good. Thanks for your fixes.

Acked-by: Geoff Levand <geoff@infradead.org>

