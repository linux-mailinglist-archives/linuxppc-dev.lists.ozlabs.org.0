Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40366C17E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 15:12:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwYrG6YQXz3fF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 01:12:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aODN7lTz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aODN7lTz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwYhL2jDMz3fBZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 01:05:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F41B60FCA;
	Mon, 16 Jan 2023 14:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED55C43392;
	Mon, 16 Jan 2023 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673877936;
	bh=yc5OYjMqNcPoUPNOcHjmUyy1SW2ocbOgpitqHAhQQrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aODN7lTzhhNBPHx0mrjxEIk/YzzpP1l2FzujXpJrMVFdCxjbIDC51x7SjWizxLaKq
	 5XQZs5UQF2omHaXjM+9RVB/ofxvtT6fCJK5ElipFfOBbAIRiNltLAk9lfJqf77TB9F
	 dyOhchbzwJhtBZk0L0ylWGIt0clvyyOJ3w/qifCtuc0eR4rrkqvPV9Tr8ztNQW9lTS
	 twRw4yxmMW47K0ygIDgfJdkCKXSzeQtJUWVI4zI8YUN5CjT6OCM4tTm+xch1ZXI18H
	 BXHC928SQhQyZeoaIxPAat/f7DdWL+MvpWHTOnL6UrUzN0aiQzeYX04ZjzSZmS4J93
	 LT07Gdva5qdtg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 08/16] ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets
Date: Mon, 16 Jan 2023 09:05:11 -0500
Message-Id: <20230116140520.116257-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140520.116257-1-sashal@kernel.org>
References: <20230116140520.116257-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 242fc66ae6e1e2b8519daacc7590a73cd0e8a6e4 ]

The fsl-asoc-card AC'97 support currently tries to route to Playback and
Capture widgets provided by the AC'97 CODEC. This doesn't work since the
generic AC'97 driver registers with an "AC97" at the front of the stream
and hence widget names, update to reflect reality. It's not clear to me
if or how this ever worked.

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20230106-asoc-udoo-probe-v1-2-a5d7469d4f67@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index d78eb9f9d24c..db663e7d17a4 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -112,8 +112,8 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 static const struct snd_soc_dapm_route audio_map_ac97[] = {
 	/* 1st half -- Normal DAPM routes */
-	{"Playback",  NULL, "CPU AC97 Playback"},
-	{"CPU AC97 Capture",  NULL, "Capture"},
+	{"AC97 Playback",  NULL, "CPU AC97 Playback"},
+	{"CPU AC97 Capture",  NULL, "AC97 Capture"},
 	/* 2nd half -- ASRC DAPM routes */
 	{"CPU AC97 Playback",  NULL, "ASRC-Playback"},
 	{"ASRC-Capture",  NULL, "CPU AC97 Capture"},
-- 
2.35.1

