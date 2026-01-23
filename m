Return-Path: <linuxppc-dev+bounces-16231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJBcMhBdc2l3vAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 12:35:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C4675210
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 12:35:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyG8D4Yxjz2xKh;
	Fri, 23 Jan 2026 22:35:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769168140;
	cv=none; b=oNIZkX3TehFGRartwNokNM6xbxLbyQvv4Xehi+Am9C+RiJUZqFGoanbFD7zcoAx6NnPA/EDlD8WupGSP+wPcdArIeoe5lAMCp4uPvkGjDNxl7vNq9fEx9a+vZcb8+eMyw1nQLohQRD7EC6vfgv3m50SfIHputW1wPXwEml2ocRnWMmlivdgRF73bqUcm3xulhgLQjZ+8SsYx2ctZlCrexKrxq3RO47d7YoEVzyRr0YAO/I60+LkSuO5RjucXtC8TVEcEMKucWXG6bVhAqg3zBFiJTDcGNJHm96YyPORntX4eFjcJtwcgY+n157Jw9qBtnf8bUEOVRLvhHHSMNsKNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769168140; c=relaxed/relaxed;
	bh=3GHYRYB2ITux0WuVizgyVZyxZ9DoarEUz4zisNgXm8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YxHnvwThfd9e+mnKKqVf+SJSsOSQ0DalA34YWpogYV8WkK+gvOKnM3OunBArt9S/gbO3KphjJ68fo21t8IepDAcUjI1skQwyoQwLp3d+EIvPdjoQIZPktcdSQBQTDtXQiLgswHD6t+6aI1kpnjyzJ++cRe7qq2d2mzcH8nYBlivO5pDX/6l5Iu4pUvzbgldZH4jpi0y6f2qAd08WSvHammsOVq30SpovQiR4TlH1BFw3D4mZqq+Ogv/RdvQ+IMZ3+VHxnBzrNSg+wImM2aq8EcgMTAORHDXhhr9UxHFvZoX9WsyjxRHxvzT14iR1puLfGPeEPp09g+syk6lwLSWnew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isrc.iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (unknown [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyG8C0sbZz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 22:35:33 +1100 (AEDT)
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-03 (Coremail) with SMTP id rQCowADny+IBXXNpK+FiBg--.58990S2;
	Fri, 23 Jan 2026 19:35:29 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: ioana.ciornei@nxp.com
Cc: chleroy@kernel.org,
	dan.carpenter@linaro.org,
	lihaoxiang@isrc.iscas.ac.cn,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	suhui@nfschina.com
Subject: Re: [PATCH v2] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
Date: Fri, 23 Jan 2026 19:35:29 +0800
Message-Id: <20260123113529.1522424-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fkoirnlbf6szpvqubamaz77433gc5uvh6fanbaonz3znsjoxxg@7ifmlxegzzwt>
References: <fkoirnlbf6szpvqubamaz77433gc5uvh6fanbaonz3znsjoxxg@7ifmlxegzzwt>
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
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADny+IBXXNpK+FiBg--.58990S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw48KryfXr45Wr1fCF4Uurg_yoWxZrcEgr
	4jqr9ay348Jr4UKr4IgFn5Zr45KFW7KFyrCryFg392qFyftr9xJFs3JF1YyFn3X3ySvw4D
	Xa4fta1vq39rujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUUUUU
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwsQE2lzVxcODAAAsX
X-Spam-Status: No, score=0.6 required=3.0 tests=RCVD_IN_DNSWL_LOW,RDNS_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16231-lists,linuxppc-dev=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ioana.ciornei@nxp.com,m:chleroy@kernel.org,m:dan.carpenter@linaro.org,m:lihaoxiang@isrc.iscas.ac.cn,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:suhui@nfschina.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lihaoxiang@isrc.iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_NEQ_ENVFROM(0.00)[lihaoxiang@isrc.iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 46C4675210
X-Rspamd-Action: no action

Hi, Ioana:

On Fri, 23 Jan 2026 13:10:46 +0200, Ioana Ciornei wrote:
> Is there any reason why you didn't go with Christophe's suggestion from
> https://lore.kernel.org/all/b7f7e968-a683-4e1e-8ccc-5dd19f0f15c5@kernel.org/ ?

> It's perfectly valid to call put_device() even though device_add() was
> not called, meaning from the other code paths.

Actually, I totally agree with that suggestion. However, I submit a same fix
several months ago and got a reply:
https://lore.kernel.org/all/2025052622-nautical-suitably-486c@gregkh/

I didn't figure out why. And if you agree with the Christophe's suggestion,
I will resubmit a patch v3.

Thanks,
Haoxiang Li 


